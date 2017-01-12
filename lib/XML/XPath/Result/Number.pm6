use v6.c;

use XML::XPath::Result;

class XML::XPath::Result::Number does XML::XPath::Result {
    has Real $.value;

    method Str {
        $.value.Str;
    }

    method Bool {
        $.value.Bool;
    }

    method Int {
        $.value;
    }

}
