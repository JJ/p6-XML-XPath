use v6.c;

use Test;
use XML::XPath;

plan 4;

my $x = XML::XPath.new(xml => q:to/ENDXML/);
<AAA>
<BBB/>
<CCC/>
<BBB/>
<DDD><BBB/></DDD>
<CCC><DDD><BBB/><BBB/></DDD></CCC>
</AAA>
ENDXML

my $set;
$set = $x.find("//BBB");
is $set.nodes.elems, 5 , 'found one node';
is $set.nodes[0].value.name, 'BBB', 'node name is BBB';

$set = $x.find("//DDD/BBB");
is $set.nodes.elems, 3 , 'found three nodes';
is $set.nodes[0].value.name, 'BBB', 'node name is BBB';

done-testing;
