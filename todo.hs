import Text.Read (Lexeme(String))

main = do 
    let options = ["add", "print", "search"]
    putStrLn "Welcome to Task Manager"
    --- enterOptions
    let tasks = ["t1", "t2", "t3", "t4"]
    printList tasks
    searchTasks tasks "Task 5"
    let newTasks = addTask tasks "Task 5"
    printList newTasks
    searchTasks newTasks "Task 5"

enterOption = do
    putStrLn "Enter option:"
    input <- getLine
    let option = read input :: String
    putStrLn option

listOptions options = do 
    putStrLn "Below are the options:"
    printList options
listTasks tasks = do
    putStrLn "Here are your tasks:"
    printList tasks

printList [] = return ()
printList (item:items) = do
    putStrLn $ "    " ++ item
    printList items

addTask taskList task = taskList ++ [task]

searchTasks [] search = do
    putStrLn $ "Could not find " ++ search
searchTasks (task:tasks) search = if task == search then putStrLn $ "Found " ++ search else searchTasks tasks search
