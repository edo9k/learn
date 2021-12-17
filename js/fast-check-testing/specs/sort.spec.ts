import * as fc from 'fast-check'
import { sort } from '../src/sort'

test('should contain the same items', () => {
  const count = (tab, element) => tab
    .filter(v => v === element).length

  fc.assert(
    fc.property(
      fc.array(fc.integer()), data => {
        const sorted = sort(data)
        expect(sorted.length).toEqual(data.length)

        for (const item of data) {
          expect(count(sorted, item))
          .toEqual(count(data, item))
        }
      }
    )
  )
})


test('should produce ordered array', () => {
  fc.assert(
    fc.property(fc.array(fc.integer()), data => {
      const sorted = sort(data)

      for (let idx = 1; idx < sorted.length; ++idx) {
        expect(sorted[idx - 1])
          .toBeLessThanOrEqual(sorted[idx])
      }
    })
  )
})

