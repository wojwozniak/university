function fib(n: number): number {
    if (n <= 1) {
        return n;
    }
    return fib(n - 1) + fib(n - 2);
}

function memoize(func: Function): Function {
    const cache: { [key: string]: any } = {};
    return function (...args: any) {
        const arg = JSON.stringify(args);
        if (!cache[arg]) {
            cache[arg] = func(...args);
        }
        return cache[arg];
    };
}

const memoizedFib = memoize(fib);
console.log(memoizedFib(4));