package com.insight.thread.callable_example;

import org.testng.annotations.Test;

import java.util.concurrent.*;

public class CompletionServiceTest {

    static class CalcResult {
        long result;

        CalcResult(long l) {
            result = l;
        }
    }

    static class CallableTask implements Callable<CalcResult> {
        String taskName;
        long input1;
        int input2;

        CallableTask(String name, long v1, int v2) {
            taskName = name;
            input1 = v1;
            input2 = v2;
        }

        public CalcResult call() {
            System.out.println(" Task " + taskName + " Started -----");
            for (int i = 0; i < input2; i++) {
                try {
                    Thread.sleep(200);
                } catch (InterruptedException e) {
                    System.out.println(" Task " + taskName + " Interrupted !! ");
                    e.printStackTrace();
                }
                input1 += i;
            }
            System.out.println(" Task " + taskName + " Completed @@@@@@");
            return new CalcResult(input1);
        }

    }

    @Test
    public void test() {
        ExecutorService executorService = Executors.newFixedThreadPool(3);
        CompletionService<CalcResult> taskCompletionService = new ExecutorCompletionService<>(executorService);

        int submittedTasks = 5;
        for (int i = 0; i < submittedTasks; i++) {
            taskCompletionService.submit(new CallableTask(
                    String.valueOf(i),
                    (i * 10),
                    ((i * 10) + 10)
            ));
            System.out.println("Task " + i + " submitted");
        }
        for (int tasksHandled = 0; tasksHandled < submittedTasks; tasksHandled++) {
            try {
                System.out.println("trying to take from Completion service");
                Future<CalcResult> result = taskCompletionService.take();
                System.out.println("result for a task available in queue.Trying to get()");
                // above call blocks till at least one task is completed and results available for it,
                // but we don't have to worry which one

                // process the result here by doing result.get()
                CalcResult l = result.get();
                System.out.println("Task " + tasksHandled + "Completed - results obtained : " + l.result);

            } catch (InterruptedException e) {
                // Something went wrong with a task submitted
                System.out.println("Error Interrupted exception");
                e.printStackTrace();
            } catch (ExecutionException e) {
                // Something went wrong with the result
                e.printStackTrace();
                System.out.println("Error get() threw exception");
            }
        }
    }
}
