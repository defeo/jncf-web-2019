#! @Chapter Examples and Tests

#! @Section Interscection in k-mat

#! @Example
LoadPackage( "LinearAlgebraForCAP" );;

Q := HomalgFieldOfRationals( );

Qmat := MatrixCategory( Q );
u1 := HomalgMatrix( [ [ 1, 2, 3 ], [ 2, 3, 4 ], [ 0, 1, 2 ] ], 3, 3, Q );
u2 := HomalgMatrix( [ [ 1, 2, 4 ], [ 3, 2, 0 ] ], 2, 3, Q );

S1 := VectorSpaceObject( 3, Q );
S2 := VectorSpaceObject( 2, Q );
V := VectorSpaceObject( 3, Q );

u1 := VectorSpaceMorphism( S1, u1, V );
u2 := VectorSpaceMorphism( S2, u2, V );

#quit;

u1;
u2;

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
