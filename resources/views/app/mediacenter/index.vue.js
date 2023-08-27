var MyComponent = {
    data: function() {
        return {
            value1: Date.now(),
            list: rootList,
            store,
        }
    },
    props: [''],
    methods: {
        greet: function() {
            helper.test();
            $('.btn-outline-success').hide();
        }
    },
    template: `
    <input type="text" name="vue" value="vue">
    <div>
    {{value1}}
    <ul>
        <li v-for="(index, x) in list" :key="x" @click="store.count++">
            abcd-{{x}}
        </li>
    </ul>
    @verbatim
        <div class="container">
            Hello, {{ store.count }}.
        </div>
    @endverbatim
    
    </div>
    `
};