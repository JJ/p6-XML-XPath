use v6.c;

use Test;
use XML::XPath;

plan 11;

my $x = XML::XPath.new(xml => q:to/ENDXML/);
<AAA>
<BBB><DDD><CCC><DDD/><EEE/></CCC></DDD></BBB>
<CCC><DDD><EEE><DDD><FFF/></DDD></EEE></DDD></CCC>
</AAA>
ENDXML

my $set;
$set = $x.find('/AAA/BBB/DDD/CCC/EEE/ancestor::*');
is $set.elems, 4, 'found 4 elements';
is $set[0].value.name, 'CCC', 'node is CCC';
is $set[1].value.name, 'DDD', 'node is EEE';
is $set[2].value.name, 'BBB', 'node is BBB';
is $set[3].value.name, 'AAA', 'node is AAA';

$set = $x.find('//FFF/ancestor::*');
is $set.elems, 5, 'found 5 elements';
is $set[0].value.name, 'DDD', 'node is DDD';
is $set[1].value.name, 'EEE', 'node is EEE';
is $set[2].value.name, 'DDD', 'node is DDD';
is $set[3].value.name, 'CCC', 'node is CCC';
is $set[4].value.name, 'AAA', 'node is AAA';

done-testing;
