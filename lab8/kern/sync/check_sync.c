#include <stdio.h>
#include <proc.h>
#include <sem.h>
#include <monitor.h>
#include <assert.h>

#define N 5 /* 哲学家数目 */
#define LEFT (i-1+N)%N /* i的左邻号码 */
#define RIGHT (i+1)%N /* i的右邻号码 */
#define THINKING 0 /* 哲学家正在思考 */
#define HUNGRY 1 /* 哲学家想取得叉子 */
#define EATING 2 /* 哲学家正在吃面 */
#define TIMES  4 /* 吃4次饭 */
#define SLEEP_TIME 10

//---------- philosophers problem using semaphore ----------------------
int state_sema[N]; /* 记录每个人状态的数组 */
/* 信号量是一个特殊的整型变量 */
semaphore_t mutex; /* 临界区互斥 */
semaphore_t s[N]; /* 每个哲学家一个信号量 */

struct proc_struct *philosopher_proc_sema[N];

void phi_test_sema(i) /* i：哲学家号码从0到N-1 */
{ 
    if(state_sema[i]==HUNGRY&&state_sema[LEFT]!=EATING
            &&state_sema[RIGHT]!=EATING)
    {
        state_sema[i]=EATING; //如果i的左右两人都没有在用餐，那么用餐  
        up(&s[i]);
        ////对一个哲学家来说，他正常情况下是 wait_queue是空的，所以这里只会value值加1，到了phi_take_forks_sema的话就是down(&s[i])处减1，如果不正常，也就是在这次尝试得到forks之前已经有排队中的事件，那么它就会wakeup那个事件 
    }
}

void phi_take_forks_sema(int i) /* i：哲学家号码从0到N-1 */
{ 
        down(&mutex); /* 进入临界区 */
        state_sema[i]=HUNGRY; /* 记录下哲学家i饥饿的事实 */
        phi_test_sema(i); /* 试图得到两只叉子 */
        up(&mutex); /* 离开临界区 */
        down(&s[i]); /* 如果得不到叉子就阻塞 */
}

void phi_put_forks_sema(int i) /* i：哲学家号码从0到N-1 */
{ 
        down(&mutex); /* 进入临界区 */
        state_sema[i]=THINKING; /* 哲学家进餐结束 */
        phi_test_sema(LEFT); /* 看一下左邻居现在是否能进餐 */
        phi_test_sema(RIGHT); /* 看一下右邻居现在是否能进餐 */
        up(&mutex); /* 离开临界区 */
}

int philosopher_using_semaphore(void * arg) /* i：哲学家号码，从0到N-1 */
{
    int i, iter=0;
    i=(int)arg;
    cprintf("I am No.%d philosopher_sema\n",i);
    while(iter++<TIMES)
    { /* 无限循环 */
        cprintf("Iter %d, No.%d philosopher_sema is thinking\n",iter,i); /* 哲学家正在思考 */
        do_sleep(SLEEP_TIME);
        phi_take_forks_sema(i); 
        /* 需要两只叉子，或者阻塞 */
        cprintf("Iter %d, No.%d philosopher_sema is eating\n",iter,i); /* 进餐 */
        do_sleep(SLEEP_TIME);
        phi_put_forks_sema(i); 
        /* 把两把叉子同时放回桌子 */
    }
    cprintf("No.%d philosopher_sema quit\n",i);
    return 0;    
}

//-----------------philosopher problem using monitor ------------
/*PSEUDO CODE :philosopher problem using monitor
 * monitor dp
 * {
 *  enum {thinking, hungry, eating} state[5];
 *  condition self[5];
 *
 *  void pickup(int i) {
 *      state[i] = hungry;
 *      if ((state[(i+4)%5] != eating) && (state[(i+1)%5] != eating)) {
 *        state[i] = eating;
 *      else
 *         self[i].wait();
 *   }
 *
 *   void putdown(int i) {
 *      state[i] = thinking;
 *      if ((state[(i+4)%5] == hungry) && (state[(i+3)%5] != eating)) {
 *          state[(i+4)%5] = eating;
 *          self[(i+4)%5].signal();
 *      }
 *      if ((state[(i+1)%5] == hungry) && (state[(i+2)%5] != eating)) {
 *          state[(i+1)%5] = eating;
 *          self[(i+1)%5].signal();
 *      }
 *   }
 *
 *   void init() {
 *      for (int i = 0; i < 5; i++)
 *         state[i] = thinking;
 *   }
 * }
 */

struct proc_struct *philosopher_proc_condvar[N]; // N philosopher
int state_condvar[N];                            // the philosopher's state: EATING, HUNGARY, THINKING  
monitor_t mt, *mtp=&mt;                          // monitor

void phi_test_condvar (i) { 
    if(state_condvar[i]==HUNGRY&&state_condvar[LEFT]!=EATING
            &&state_condvar[RIGHT]!=EATING) {
        cprintf("phi_test_condvar: state_condvar[%d] will eating\n",i);
        state_condvar[i] = EATING ;
        cprintf("phi_test_condvar: signal self_cv[%d] \n",i);
        cond_signal(&mtp->cv[i]) ;
    }
}


void phi_take_forks_condvar(int i) {
     down(&(mtp->mutex));
//--------into routine in monitor--------------
     // LAB7 EXERCISE1: YOUR CODE
     // I am hungry
     state_condvar[i]=HUNGRY; 
      // try to get fork
      phi_test_condvar(i); 
      while (state_condvar[i] != EATING) {
          cprintf("phi_take_forks_condvar: %d didn't get fork and will wait\n",i);
          cond_wait(&mtp->cv[i]);
      }
//--------leave routine in monitor--------------
      if(mtp->next_count>0)
         up(&(mtp->next));
      else
         up(&(mtp->mutex));
}

void phi_put_forks_condvar(int i) {
     down(&(mtp->mutex));

//--------into routine in monitor--------------
     // LAB7 EXERCISE1: YOUR CODE
      // I ate over 
      state_condvar[i]=THINKING;
      // test left and right neighbors
      phi_test_condvar(LEFT);
      phi_test_condvar(RIGHT);
//--------leave routine in monitor--------------
     if(mtp->next_count>0)
        up(&(mtp->next));
     else
        up(&(mtp->mutex));
}

//---------- philosophers using monitor (condition variable) ----------------------
int philosopher_using_condvar(void * arg) { /* arg is the No. of philosopher 0~N-1*/
  
    int i, iter=0;
    i=(int)arg;
    cprintf("I am No.%d philosopher_condvar\n",i);
    while(iter++<TIMES)
    { /* iterate*/
        cprintf("Iter %d, No.%d philosopher_condvar is thinking\n",iter,i); /* thinking*/
        do_sleep(SLEEP_TIME);
        phi_take_forks_condvar(i); 
        /* need two forks, maybe blocked */
        cprintf("Iter %d, No.%d philosopher_condvar is eating\n",iter,i); /* eating*/
        do_sleep(SLEEP_TIME);
        phi_put_forks_condvar(i); 
        /* return two forks back*/
    }
    cprintf("No.%d philosopher_condvar quit\n",i);
    return 0;    
}

void check_sync(void){

    int i;

    //check semaphore 信号量
    sem_init(&mutex, 1); //mutex是资源，mutex是全局变量，初始值为 1，这个 mutex不是指刀叉，而是指操作哲学家们状态的“锁”
    for(i=0;i<N;i++){
        sem_init(&s[i], 0); //在这里给每一个 sem做初始化，s是指刀叉  
        int pid = kernel_thread(philosopher_using_semaphore, (void *)i, 0);
        if (pid <= 0) {
            panic("create No.%d philosopher_using_semaphore failed.\n");
        }
        philosopher_proc_sema[i] = find_proc(pid);
        set_proc_name(philosopher_proc_sema[i], "philosopher_sema_proc");
    }

    //check condition variable 管程模式
    monitor_init(&mt, N);
    for(i=0;i<N;i++){
        state_condvar[i]=THINKING;
        int pid = kernel_thread(philosopher_using_condvar, (void *)i, 0);//启动所有哲学家的进程，但是这里起的进程是 condvar的
        if (pid <= 0) {
            panic("create No.%d philosopher_using_condvar failed.\n");
        }
        philosopher_proc_condvar[i] = find_proc(pid);
        set_proc_name(philosopher_proc_condvar[i], "philosopher_condvar_proc");
    }
}
