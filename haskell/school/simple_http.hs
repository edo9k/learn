import Network.HTTP.Conduit
import qualified Data.ByteString.Lazy as L

main = simpleHttp "http://derkraken.blogspot.com/" >>= L.putStr

