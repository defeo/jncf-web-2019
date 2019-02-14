LoadPackage( "Bialgebroids" );

q := RightQuiver( "q(3)[a:1->2,b:2->1,c:2->3]" );
Q := HomalgFieldOfRationals();
Aoid := Algebroid( Q, q );
m := SetOfGeneratingMorphisms( Aoid );
a := m[1];
b := m[2];
c := m[3];
2*a;
-b;
PreCompose( a, b );
PreCompose( [ a, b, a ] );
PreCompose( [ a, b, a, c ] );
