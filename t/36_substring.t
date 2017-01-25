use v6.c;

use Test;
use XML::XPath;

plan 11;

my $x = XML::XPath.new(xml => q:to/ENDXML/);
<page></page>
ENDXML

is $x.find('substring("12345",2,3)'),          "234";
is $x.find('substring("12345",2)'),            "2345";
is $x.find('substring("12345",-2)'),           "12345";
is $x.find('substring("12345",1.5,2.6)'),      "234";
is $x.find('substring("12345",0div0,3)'),      "";
is $x.find('substring("12345",1,0div0)'),      "";
is $x.find('substring("12345",-1div0,1div0)'), "";
is $x.find('substring("12345",-42,1div0)'),    "12345";
is $x.find('substring("12345",0,1div0)'),      "12345";
is $x.find('substring("12345",0,3)'),          "12";
is $x.find('substring("12345",-1,4)'),         "12";

done-testing
