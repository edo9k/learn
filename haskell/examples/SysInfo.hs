
import System.Process


getCpuInfo :: IO String
getCpuInfo = readProcess "cat" ["/proc/cpuinfo"] ""

getMemInfo :: IO String
getMemInfo = readProcess "cat" ["/proc/meminfo"] ""


main :: IO ()
main = do 
  cpuInfo <- getCpuInfo
  memInfo <- getMemInfo

  putStrLn " -------------------------------------------- "
  putStrLn " -- CPU and Memory information from System -- " 
  putStrLn " -------------------------------------------- "
   
  putStrLn "CPU Information: "
  putStrLn cpuInfo
  
  putStrLn "Memory Information: " 
  putStrLn memInfo 

