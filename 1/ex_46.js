const tolerance = 0.00001

function iterativeImprove(isGoodEnough, improve) {

    const _iterativeImprove = (guess) => {

        if (isGoodEnough(guess)) {
            return improve(guess)
        }
        return _iterativeImprove(improve(guess))
    }
    return _iterativeImprove
}

function fixedPoint(f, firstGuess) {

    const isGoodEnough = (guess) => {
        const next = f(guess)
        return Math.abs(guess - next) < tolerance
    }

    return iterativeImprove(isGoodEnough, f)(firstGuess)
}

console.log(fixedPoint(Math.cos, 1.0))

function sqrt(x) {

    const isGoodEnough = (guess) => {
        return Math.abs(guess * guess - x) < tolerance
    }

    const average = (x, y) => (x + y) / 2

    const improve = (guess) => {
        return average(guess, x / guess)
    }

    return iterativeImprove(isGoodEnough, improve)(1.0)
}

console.log(sqrt(9))

