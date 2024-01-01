let obiekt = {
    prop: "val",

    method: function() {
        return "method";
    },

    get getter() {
        return this.prop;
    },

    set setter(val) {
        this.prop = val;
    }
};

Object.defineProperty(obiekt, 'newProp', {
    value: "newPropVal",
    writable: true
});

Object.defineProperty(obiekt, 'newFunction', {
    value: function() {
        return "newFuction";
    }
});

Object.defineProperty(obiekt, 'newMethods', {
    get: function() {
        return this.newProp;
    },
    set: function(val) {
        this.newProp = val;
    }
});

// Kiedy trzeba (np.):
// - read only
// - not enumerable