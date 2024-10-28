main = do 
    putStrLn "Welcome to Task Manager"
    enterOption []

enterOption taskList = do
    putStrLn "Below are the options:"
    printList ["add", "print", "search"]
    putStrLn "Enter option:"
    option <- getLine
    parseOption option taskList

parseOption option taskList
    | option == "add" = addTask taskList
    | option == "print" = listTasks taskList
    | option == "search" = searchTasks taskList
    | otherwise = do
        putStrLn "Error"
        enterOption taskList

printList [] = return ()
printList (item:items) = do
    putStrLn $ "    " ++ item
    printList items

listTasks taskList = do
    putStrLn "Here are your tasks:"
    printList taskList
    enterOption taskList

addToList [] item = [item]
addToList list item = list ++ [item]

addTask taskList = do
    putStrLn "Enter Task to Add:"
    task <- getLine
    enterOption (addToList taskList task)
    
searchList [] search = False
searchList (item:items) search
    | item == search = True
    | otherwise = searchList items search

searchTasks taskList = do
    putStrLn "Enter Task to Search:"
    task <- getLine
    if searchList taskList task then putStrLn $ "Found " ++ task else putStrLn $ "Could not find " ++ task
    enterOption taskList