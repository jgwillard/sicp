/**
 * js implementation of exercise 2.5
 *
 * 2 and 3 are both prime, meaning they have no common divisor apart
 * from 1, so we store a pair of numbers a and b as 2^a * 3^b and
 * "unwrap" them by dividing that number by 2 until 2 no longer divides
 * it, and the number of divisions gives us a (likewise for b but we
 * divide by 4)
 *
 * this technique will work for any coprime pair of integers greater
 * than 1 (e.g 8 and 9), but because 2 and 3 are the smallest such pair
 * they will lead to the smallest numerical representation of the pair,
 * which is important as this implementation of pairs of numbers will
 * quickly bump up against number storage limitations
 */
const x = 2
const y = 3

function cons(a, b) {
    return x**a * y**b
}

function car(p) {
    let count = 0
    while (p % x === 0) {
        p /= x
        count++
    }
    return count
}

function cdr(p) {
    let count = 0
    while (p % y === 0) {
        p /= y
        count++
    }
    return count
}

p = cons(6, 13)
console.log(p)
console.log(car(p))
console.log(cdr(p))
