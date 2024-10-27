main = do 
    putStrLn "Welcome to Task Manager"
    let tasks = ["t1", "t2", "t3", "t4"]
    printTasks tasks

printTasks taskList = do mapM putStrLn taskList