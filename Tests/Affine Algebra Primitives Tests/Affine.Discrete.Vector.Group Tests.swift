import Affine_Algebra_Primitives
import Testing

@Suite("Affine.Discrete.Vector.Group Tests")
struct AffineDiscreteVectorGroupTests {
    @Suite struct Unit {}
}

extension AffineDiscreteVectorGroupTests.Unit {
    @Test
    func `identity is zero`() {
        let group = Affine.Discrete.Vector.group
        #expect(group.identity == .zero)
    }

    @Test
    func `combining matches addition`() {
        let group = Affine.Discrete.Vector.group
        let a: Affine.Discrete.Vector = 3
        let b: Affine.Discrete.Vector = 5
        #expect(group.combining(a, b) == a + b)
    }

    @Test
    func `inverting matches negation`() {
        let group = Affine.Discrete.Vector.group
        let a: Affine.Discrete.Vector = 7
        #expect(group.inverting(a) == -a)
    }

    @Test
    func `identity left`() {
        let group = Affine.Discrete.Vector.group
        let a: Affine.Discrete.Vector = 7
        #expect(group.combining(group.identity, a) == a)
    }

    @Test
    func `identity right`() {
        let group = Affine.Discrete.Vector.group
        let a: Affine.Discrete.Vector = 7
        #expect(group.combining(a, group.identity) == a)
    }

    @Test
    func `inverse left`() {
        let group = Affine.Discrete.Vector.group
        let a: Affine.Discrete.Vector = 7
        #expect(group.combining(group.inverting(a), a) == group.identity)
    }

    @Test
    func `inverse right`() {
        let group = Affine.Discrete.Vector.group
        let a: Affine.Discrete.Vector = 7
        #expect(group.combining(a, group.inverting(a)) == group.identity)
    }

    @Test
    func `commutativity`() {
        let group = Affine.Discrete.Vector.group
        let a: Affine.Discrete.Vector = 3
        let b: Affine.Discrete.Vector = -5
        #expect(group.combining(a, b) == group.combining(b, a))
    }
}
