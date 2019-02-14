#! @Chapter Examples and Tests

#! @Section Interscection in Adelman

#! @Example
LoadPackage( "FreydCategoriesForCAP" );;

Q := HomalgFieldOfRationals( );

q := RightQuiver( "q(g1,g2,d)[u1:g1->d,u2:g2->d]" );
Aoid := Algebroid( Q, q );
CapCategorySwitchLogicOff( Aoid );
INSTALL_HOMOMORPHISM_STRUCTURE_FOR_BIALGEBROID( Aoid );
m := SetOfGeneratingMorphisms( Aoid );
u1 := m[1];
u2 := m[2];

#quit;

u1;
u2;

add := AdditiveClosure( Aoid );
adelman := AdelmanCategory( add );

u1 := AsAdditiveClosureMorphism( u1 );
u2 := AsAdditiveClosureMorphism( u2 );
u1 := AsAdelmanCategoryMorphism( u1 );
u2 := AsAdelmanCategoryMorphism( u2 );

## Algorithm 1
m1 := ImageEmbedding( u1 );
m2 := ImageEmbedding( u2 );
#cm := UniversalMorphismFromDirectSum( m1, m2 );
#n := KernelEmbedding( cm );
#n1 := PreCompose( n, ProjectionInFactorOfDirectSum( [ Source( m1 ), Source( m2 ) ], 1 ) );
n1 := ProjectionInFactorOfFiberProduct( [ m1, m2 ], 1 );
i1 := PreCompose( n1, m1 );

## Algorithm 2
e2 := CokernelProjection( u2 );
w1 := PreCompose( u1, e2 );
k1 := KernelEmbedding( w1 );
v1 := PreCompose( k1, u1 );
s1 := ImageEmbedding( v1 );

## "Proof of correctness" of Algorithm 2
f := LiftAlongMonomorphism( i1, s1 );
Assert( 0, IsIsomorphism( f ) );

## Algorithm 3
e1 := CokernelProjection( u1 );
e2 := CokernelProjection( u2 );
a := UniversalMorphismIntoDirectSum( e1, e2 );
k := KernelEmbedding( a );

## "Proof of correctness" of Algorithm 3
l := KernelLift( a, s1 );
Assert( 0, IsIsomorphism( l ) );
