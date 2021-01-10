module ShowParser ( parseShow )
where
import Text.ParserCombinators.Parsec
import qualified Text.ParserCombinators.Parsec.Token as P
import Text.ParserCombinators.Parsec.Language

xml_header = "<?xml version=\"1.0\" encoding=\"UTF-8\">\n"

parseShow :: String -> String
parseShow = \str -> xml_header ++ (run_parser showParser str)

run_parser :: Parser a -> String -> a
run_parser p str = case parse p "" str of
  Left err -> error $ "parse error at " ++ (show err)
  Right val -> val

otag t = "<"++t++">"
ctag t =


lexer = P.makeTokenParser emptyDef

parens          = P.parens        lexer
brackets        = P.brackets      lexer
braces          = P.braces        lexer
commaSep        = P.commaSep      lexer
whiteSpace      = P.whiteSpace    lexer
symbol          = P.symbol        lexer
identifier      = P.identifier    lexer
integer         = P.integer       lexer
stringLiteral   = P.stringLiteral lexer


