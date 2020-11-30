// 导入模板元素 从lwc模板导入
import { LightningElement,track } from 'lwc';
// 声明这个类是已经公开的组件 LightningElement为Lightning Web组件创建JavaScript类
export default class HelloIteration extends LightningElement {
// 取引先
    contacts = [
        {
            Id: 1,
            Name: 'Amy Taylor',
            Title: 'VP of Engineering',
        },
        {
            Id: 2,
            Name: 'Michael Jones',
            Title: 'VP of Sales',
        },
        {
            Id: 3,
            Name: 'Jennifer Wu',
            Title: 'CEO',
        },
    ];
}