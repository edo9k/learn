import fc from 'fast-check'
import { fib } from '../src/fibonacci'

const MaxN = 1000


describe('fibonacci', () => {
  it('should be equal to the sum of fib(n-1) and fib(n-2)', () => {
    fc.assert(
      fc.property(fc.integer(2, MaxN), n => {
        expect(fib(n)).toBe(fib(n - 1) + fib(n - 2))
      })
    )
  })

})
