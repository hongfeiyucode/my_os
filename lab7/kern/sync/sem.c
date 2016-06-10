#include <defs.h>
#include <wait.h>
#include <atomic.h>
#include <kmalloc.h>
#include <sem.h>
#include <proc.h>
#include <sync.h>
#include <assert.h>

void
sem_init(semaphore_t *sem, int value) {
    sem->value = value;
    wait_queue_init(&(sem->wait_queue));
}

static __noinline void __up(semaphore_t *sem, uint32_t wait_state) {
    bool intr_flag;
    local_intr_save(intr_flag); //关中断 
    {
        wait_t *wait;
        if ((wait = wait_queue_first(&(sem->wait_queue))) == NULL) {
            sem->value ++; //等待队列为空，那么空闲个数加1 
        }
        else {
            assert(wait->proc->wait_state == wait_state);
            wakeup_wait(&(sem->wait_queue), wait, wait_state, 1); //等待队列不为空且状态是wait_state那么唤醒这个进程，wait是queue_first 
        }
    }
    local_intr_restore(intr_flag); //开中断
}

static __noinline uint32_t __down(semaphore_t *sem, uint32_t wait_state) {
    bool intr_flag;
    local_intr_save(intr_flag);
    if (sem->value > 0) { //如果空闲个数是大于 0的，那么就可以直接运行了，什么也不用做，进程照常进行  
        sem->value --;
        local_intr_restore(intr_flag);
        return 0;
    }
    wait_t __wait, *wait = &__wait;
    wait_current_set(&(sem->wait_queue), wait, wait_state);//入队操作，新创建的wait的状态也要全部设置好
    local_intr_restore(intr_flag);

    schedule(); //因为正在运行的进程来到这里进入了等待状态，所以它要让出 CPU，所以要申请调度schedule() 
    //schedule一般不会回来，但是当进行进程切换 proc_run时，本进程记录下的eip是这里，所以被别的进程唤醒后会回到这里 

    local_intr_save(intr_flag);
    wait_current_del(&(sem->wait_queue), wait); //调度的结果是回到这里，那么就让wait出队，醒来后把自己从队列中去除  
    local_intr_restore(intr_flag);

    if (wait->wakeup_flags != wait_state) {
        return wait->wakeup_flags;
    }
    return 0;
}

void
up(semaphore_t *sem) {
    __up(sem, WT_KSEM);
}

void
down(semaphore_t *sem) {
    uint32_t flags = __down(sem, WT_KSEM);
    assert(flags == 0);
}

bool
try_down(semaphore_t *sem) {
    bool intr_flag, ret = 0;
    local_intr_save(intr_flag);
    if (sem->value > 0) {
        sem->value --, ret = 1;
    }
    local_intr_restore(intr_flag);
    return ret;
}

