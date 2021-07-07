import System.Directory

main = do
  getCurrentDirectory       >>= print
  getHomeDirectory          >>= print
  getUserDocumentsDirectory >>= print

