function fringe(tree) {
    let leaves = []
    for (let i = 0; i < tree.length; i++) {
        if (Array.isArray(tree[i])) {
            leaves = leaves.concat(fringe(tree[i]))
        }
        else {
            leaves.push(tree[i])
        }
    }
    return leaves
}


const x = [[1, 2], [3, 4]]

console.log(fringe(x))

console.log(fringe([x, x]))
