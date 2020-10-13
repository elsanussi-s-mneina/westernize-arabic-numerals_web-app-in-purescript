module NumeralsConversion where

import Prelude

import Data.Maybe (Maybe(Just, Nothing))
import Data.String.CodeUnits (indexOf, singleton, toCharArray, fromCharArray)
import Data.String.Pattern (Pattern(Pattern))
import Effect (Effect)
import Effect.Console (log)

isIn :: Char -> String -> Boolean
isIn needle haystack = 
  let result = indexOf (Pattern (singleton needle)) haystack
  in case result of 
       Just _ -> true 
       Nothing -> false 

westernizeNumeral :: Char -> Char
westernizeNumeral character =
  case character of
    _ | isIn character "٠۰०০੦૦୦౦೦൦๐໐༠၀០᠐᥆߀௦᧐᭐႐᮰᱀᱐꘠꣐꤀꩐᪀᪐꧐꯰𑁦𑃰𑄶𑇐𑛀𑙐𑜰꧰𖭐෦𑋰𑓐𑣠𖩠" -> '0'
    _ | isIn character "١۱१১੧૧୧௧౧೧൧๑໑༡၁፩១᠑᥇߁᧑᭑𐩀႑᮱᱁᱑꘡꣑꤁꩑᧚᪁᪑꧑꯱𐹠𑁧𑃱𑄷𑇑𑛁𑙑𑜱𑇡꧱𐋡𖭑𑍧෧𑋱𑓑𞣇𑣡𖩡" -> '1'
    _ | isIn character "٢۲२২੨૨୨௨౨೨൨๒໒༢၂፪២᠒᥈𐒢߂᧒᭒𐩁႒᮲᱂᱒꘢꣒꤂꩒᪂᪒꧒꯲𐹡𑁨𑃲𑄸𑇒𑛂𑙒𑜲𑇢꧲𐋢𖭒෨𑋲𑓒𞣈𑣢𖩢" -> '2'
    _ | isIn character "٣۳३৩੩૩୩௩౩೩൩๓໓༣၃፫៣᠓᥉𐒣߃᧓᭓𐩂႓᮳᱃᱓꘣꣓꤃꩓᪃᪓꧓꯳𐹢𑁩𑃳𑄹𑇓𑛃𑙓𑜳𑇣꧳𐋣𖭓෩𑋳𑓓𑣣𖩣" -> '3'
    _ | isIn character "٤۴४৪੪૪୪௪౪೪൪๔໔༤၄፬៤᠔᥊𐒤߄᧔᭔𐩃႔᮴᱄᱔꘤꣔꤄꩔᪄᪔꧔꯴𐹣𑁪𑃴𑄺𑇔𑛄𑙔𑜴𑇤꧴𐋤𖭔෪𑋴𑓔𞣊𑣤𖩤" -> '4'
    _ | isIn character "٥۵५৫੫૫୫௫౫೫൫๕໕༥၅፭៥᠕᥋𐒥߅᧕႕᮵᱅᱕꣕꤅꩕᪅᪕꧕꯵𐹤𑁫𑃵𑄻𑇕𑛅𑙕𑜵𑇥꧵𐋥𖭕𑍫෫𑋵𑓕𞣋𑣥𖩥" -> '5'
    _ | isIn character "٦۶६৬੬૬୬௬౬೬൬๖໖༦၆፮៦᠖᥌𐒦߆᧖᭖႖᮶᱆᱖꘦꣖꤆꩖᪆᪖꧖꯶𐹥𑁬𑃶𑄼𑇖𑛆𑙖𑜶𑜶𑇦꧶𐋦𖭖෬𑋶𑓖𞣌𑣦𖩦" -> '6'
    _ | isIn character "٧۷७৭੭૭୭௭౭೭൭๗໗༧၇፯៧᠗᥍𐒧߇᧗᭗႗᮷᱇᱗꘧꣗꤇꩗᪇᪗꧗꯷𐹦𑁭𑃷𑄽𑇗𑛇𑙗𑜷𑇧𐋧𖭗෭𑋷𑓗𞣍𑣧𑣧𖩧꧷" -> '7'
    _ | isIn character "٨۸८৮੮૮୮௮౮೮൮๘໘༨၈፰៨᠘᥎߈᧘᭘႘᮸᱈᱘꘨꣘꤈꩘᪈᪘꧘꯸𐹧𑁮𑃸𑄾𑇘𑛈𑛈𑙘𑜸𑇨꧸𖭘𐋨෮𑋸𑓘𞣎𑣨𖩨" -> '8'
    _ | isIn character "٩۹९৯੯૯୯௯౯೯൯๙໙༩၉፱៩᠙᥏𐒩߉᧙᭙႙᮹᱉᱙꘩꣙꤉꩙᪉᪙꧙꯹𐹨𑁯𑃹𑄿𑇙𑛉𑙙𑜹𑇩꧹𐋩𖭙෯𑋹𑓙𞣏𑣩𖩩" -> '9'
    _ -> character  -- do not change non-numeral characters


westernizeNumerals :: String -> String
westernizeNumerals aString =
  fromCharArray (map westernizeNumeral (toCharArray aString))
