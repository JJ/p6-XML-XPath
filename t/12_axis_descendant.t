use v6.c;

use Test;
use XML::XPath;

plan 4;

my $x = XML::XPath.new(xml => q:to/ENDXML/);
<AAA>
  <BBB>
    <DDD>
      <CCC>
        <DDD/>
        <EEE/>
      </CCC>
    </DDD>
  </BBB>
  <CCC>
    <DDD>
      <EEE>
        <DDD>
          <FFF/>
        </DDD>
      </EEE>
    </DDD>
  </CCC>
</AAA>
ENDXML


my $set;
# 10 because not self!
$set = $x.find('/descendant::*');
is $set.elems, 10, 'found 10 elements';

$set = $x.find('/AAA/BBB/descendant::*');
is $set.elems, 4, 'found 4 elements';

$set = $x.find('//CCC/descendant::*');
is $set.elems, 6, 'found 5 elements';

$set = $x.find('//CCC/descendant::DDD');
is $set.elems, 3, 'found 3 elements';


done-testing;
