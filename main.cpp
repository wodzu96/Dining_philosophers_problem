#include <iostream>
#include <thread>
#include <unistd.h>
#include <cstdlib>
#include <ncurses.h>
#include <algorithm>
#include <ctime>

enum philosopherStatus {
    philosophizing,
    eating,
    waiting,
    permission_added
};

struct Philosopher{
    philosopherStatus status;
    int hunger;
};

	 static const int num_threads = 7;
	 using namespace std;
	 thread t[num_threads];
    pthread_mutex_t	mutexes[] = {PTHREAD_MUTEX_INITIALIZER, PTHREAD_MUTEX_INITIALIZER, PTHREAD_MUTEX_INITIALIZER, PTHREAD_MUTEX_INITIALIZER, PTHREAD_MUTEX_INITIALIZER};
    Philosopher philosophers[num_threads-2];
    int philosophers_sort[num_threads-2];
	 //This function will be called from a thread
	 int screenHeight = 0;
	int screenWidth = 0;

    bool compareByHunger(const int &a, const int &b)
    {
        return philosophers[a].hunger < philosophers[b].hunger;
    }


    void waitForMakeMutexesFree(){
        for(int i = 0; i<5; ++i) {
            pthread_mutex_lock(&mutexes[i]);
        }
    }

    void unlockAllMutexes(){
        for(int i = 0; i<5; ++i) {
            pthread_mutex_unlock(&mutexes[i]);
        }
    }

    void showPhilosopher(int id){
        string tekst = "Filozof nr: ";
        mvprintw( (screenHeight/3)*(id/2),(screenWidth/2)*(id%2), tekst.append(to_string(id)).c_str() ); //2
        string status_tekst = "Aktualny status: ";
        if(philosophers[id].hunger>0)
            switch (philosophers[id].status){
                case eating: status_tekst.append("jedzenie");
                    break;
                case philosophizing: status_tekst.append("filozofowanie");
                    break;
                case waiting: status_tekst.append("czekanie na jedzenie");
                    break;
                case permission_added: status_tekst.append("dostal rozkaz jedzenia");
                    break;
            }
        else
            status_tekst.append("umarl");
        mvprintw( (screenHeight/3)*(id/2)+1,(screenWidth/2)*(id%2), status_tekst.c_str() );
        string hunger_text = "Poziom glodu: ";
        mvprintw( (screenHeight/3)*(id/2)+2,(screenWidth/2)*(id%2), hunger_text.append(to_string(philosophers[id].hunger)).c_str() );

    }

    void showDeadQueue(){
        mvprintw((int) (screenHeight * 0.66), screenWidth / 2, "Kolejka do umierania: ");
        for(int i = 1; i<num_threads-1; ++i){
            string philosopher_text = "Filozof nr: ";
            philosopher_text.append(to_string(philosophers_sort[i-1]));
            philosopher_text.append(" poziom glodu: ");
            philosopher_text.append(to_string(philosophers[philosophers_sort[i-1]].hunger));
            mvprintw((int) (screenHeight * 0.66) + i, screenWidth / 2, philosopher_text.c_str());
        }
    }

    void showPhilosophers(){
        while(t[num_threads-1].joinable()) {
            clear();
            for (int i = 0; i < num_threads-2; ++i) {
                showPhilosopher(i);
            }
            showDeadQueue();
            refresh();
            usleep(300000);
        }

    }

	 void call_from_thread(int tid) {
         while(philosophers[tid].hunger>0 && t[tid].joinable()){
             pthread_mutex_lock(&mutexes[tid]);
             if(philosophers[tid].status == permission_added)
                 philosophers[tid].status = eating;
             if(philosophers[tid].status == eating && philosophers[tid].hunger > 99)
                 philosophers[tid].status = philosophizing;
             else if(philosophers[tid].status == philosophizing && philosophers[tid].hunger < 40)
                 philosophers[tid].status = waiting;
             if(philosophers[tid].status==eating)
                 philosophers[tid].hunger+=2;
             else
                 --philosophers[tid].hunger;
             pthread_mutex_unlock(&mutexes[tid]);
             usleep(300000);
         }
         t[tid].detach();
     }

    void waiter(){
        while(t[num_threads-2].joinable()) {
            usleep(300000);
            waitForMakeMutexesFree();
            sort(philosophers_sort, philosophers_sort+num_threads-2, compareByHunger);
            for(int i = 0; i<num_threads-2; ++i){
                if(philosophers[philosophers_sort[i]].status==waiting && philosophers[philosophers_sort[i]].hunger!=0 &&
                        philosophers[(philosophers_sort[i]+4)%5].status != eating && philosophers[(philosophers_sort[i]+4)%5].status != permission_added
                        && philosophers[(philosophers_sort[i]+1)%5].status != eating && philosophers[(philosophers_sort[i]+1)%5].status != permission_added)
                    philosophers[philosophers_sort[i]].status=permission_added;
            }
            unlockAllMutexes();
        }
    }


	 int main() {

		 //start
		 initscr();

		 //Pobieranie wartości okna do zmiennych
		 getmaxyx( stdscr, screenHeight, screenWidth ); //1

		 srand( time( NULL ) );
		 for (int i = 0; i < num_threads-2; ++i) {
			 philosophers[i].hunger = rand()%80+20;
             pthread_mutex_init(&mutexes[i],NULL);
			t[i] = thread(call_from_thread, i);
             philosophers_sort[i] = i;
			 usleep(5000);
			}
         t[num_threads-2] = thread(waiter);
         t[num_threads-1] = thread(showPhilosophers);

		 getch();

		 //Join the threads with the main thread

		 for (int i = 0; i < num_threads; ++i) {
             if(t[i].joinable())
				  t[i].detach();
		  }

         endwin();
		 return 0;
  }