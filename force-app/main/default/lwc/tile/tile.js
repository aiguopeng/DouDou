import { LightningElement, api } from 'lwc';
export default class Tile extends LightningElement {

    @api product;
    tileClick() {
        console.log("product:" + this.product)
        console.log("tileClick1")
        const event = new CustomEvent('tileclick', {
            // detail contains only primitives
            detail: this.product.fields.Id.value
        });
        console.log("tileClick2")
        // Fire the event from c-tile
        this.dispatchEvent(event);
        console.log("tileClick3")
    }
}