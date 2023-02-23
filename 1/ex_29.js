function simpsonsIntegral(f, a, b, n) {

    const h = (b - a) / n
    const y = (k) => f(a + k * h)
    const term = (k) => {
        if (k === 0) {
            return y(k)
        }
        else if (k % 2 === 0) {
            return 2 * y(k)
        }
        else {
            return 4 * y(k)
        }
    }

    const simpsonsIntegralRec = (k) => {
        if (k > n) {
            return 0
        }
        else {
            return term(k) + simpsonsIntegralRec(k + 1)
        }
    }

    return (h / 3) * simpsonsIntegralRec(0)

}

function square(x) {
    return x * x
}

function cube(x) {
    return x * x * x
}

console.log(simpsonsIntegral(square, 0, 1, 1000))
console.log(simpsonsIntegral(square, 0, 2, 1000))
console.log(simpsonsIntegral(cube, 0, 1, 1000))
console.log(simpsonsIntegral(cube, 0, 2, 1000))
