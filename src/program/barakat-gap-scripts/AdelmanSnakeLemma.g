#! @Chapter Examples and Tests

#! @Section Adelman category basics

LoadPackage( "FreydCategoriesForCAP" );;
LoadPackage( "GeneralizedMorphismsForCAP" );;

#! @Example
SwitchGeneralizedMorphismStandard( "span" );
q := RightQuiver( "q(4)[a:1->2,b:2->3,c:3->4]" );
kq := PathAlgebra( HomalgFieldOfRationals(), q );
Aoid := Algebroid( kq, [ kq.abc ] );
CapCategorySwitchLogicOff( Aoid );
INSTALL_HOMOMORPHISM_STRUCTURE_FOR_BIALGEBROID( Aoid );
m := SetOfGeneratingMorphisms( Aoid );
a := m[1];
b := m[2];
c := m[3];

quit;

a;
b;
c;
add := AdditiveClosure( Aoid );
adelman := AdelmanCategory( add );
G_adelmann := GeneralizedMorphismCategory( adelman );
a := AsAdditiveClosureMorphism( a );
b := AsAdditiveClosureMorphism( b );
c := AsAdditiveClosureMorphism( c );
aa := AsAdelmanCategoryMorphism( a );
bb := AsAdelmanCategoryMorphism( b );
cc := AsAdelmanCategoryMorphism( c );
dd := CokernelProjection( aa );
ee := CokernelColift( aa, PreCompose( bb, cc ) );
ff := KernelEmbedding( ee );
gg := KernelEmbedding( cc );
hh := KernelLift( cc, PreCompose( aa, bb ) );
ii := CokernelProjection( hh );
fff := AsGeneralizedMorphism( ff );
ddd := AsGeneralizedMorphism( dd );
bbb := AsGeneralizedMorphism( bb );
ggg := AsGeneralizedMorphism( gg );
iii := AsGeneralizedMorphism( ii );
sss := PreCompose( [ fff, PseudoInverse( ddd ), bbb, PseudoInverse( ggg ), iii ] );
IsHonest( sss );
#! true
jj := KernelObjectFunctorial( bb, dd, ee );
ss := HonestRepresentative( sss );
comp := PreCompose( jj, ss );
IsZero( comp );
