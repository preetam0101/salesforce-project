import { LightningElement, track } from 'lwc';

export default class calculatorJi extends LightningElement {

    @track display = '';

    buttons = [ 
        '7','8','9','/',
        '4','5','6','*',
        '1','2','3','-',
        '0','.','=','+','C'
    ];

    handleClick(event) {
        const value = event.target.dataset.value;

        if (value === 'C') {
            this.display = '';
        } 
        else if (value === '=') {
            try {
                // Use Function constructor instead of eval for safety
                // eslint-disable-next-line no-new-func
                this.display = new Function('return ' + this.display)();
            } catch (e) {
                this.display = 'Error';
            }
        } 
        else {
            this.display += value;
        }
    }
}