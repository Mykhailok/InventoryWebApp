/**
 * Created by Shishkov on 26.06.2017.
 */

'use strict';

$(function () {

	var myData = void 0;
	myData = [{
		id: 1,
		name: 'notebook',
		manufac: 'asus',
		owner: 'Masha',
		price: 1200,
		descrip: 'black',
		edit: false,
		mdelete: false
	}, {
		id: 2,
		name: 'notebook',
		manufac: 'hp',
		owner: 'Petya',
		price: 1000,
		descrip: 'white',
		edit: false,
		mdelete: false
	}, {
		id: 3,
		name: 'phone',
		manufac: 'philips',
		owner: 'Petya',
		price: 500,
		descrip: 'red',
		edit: false,
		mdelete: false
	}, {
		id: 4,
		name: 'notebook',
		manufac: 'asus',
		owner: 'Masha',
		price: 1200,
		descrip: 'black',
		edit: false,
		mdelete: false
	}, {
		id: 5,
		name: 'notebook',
		manufac: 'hp',
		owner: 'Petya',
		price: 1000,
		descrip: 'white',
		edit: false,
		mdelete: false
	}, {
		id: 6,
		name: 'phone',
		manufac: 'philips',
		owner: 'Petya',
		price: 500,
		descrip: 'red',
		edit: false,
		mdelete: false
	}, {
		id: 7,
		name: 'notebook',
		manufac: 'asus',
		owner: 'Masha',
		price: 1200,
		descrip: 'black',
		edit: false,
		mdelete: false
	}, {
		id: 8,
		name: 'notebook',
		manufac: 'hp',
		owner: 'Petya',
		price: 1000,
		descrip: 'white',
		edit: false,
		mdelete: false
	}, {
		id: 9,
		name: 'phone',
		manufac: 'philips',
		owner: 'Petya',
		price: 500,
		descrip: 'red',
		edit: false,
		mdelete: false
	}, {
		id: 10,
		name: 'notebook',
		manufac: 'asus',
		owner: 'Masha',
		price: 1200,
		descrip: 'black',
		edit: false,
		mdelete: false
	}, {
		id: 11,
		name: 'notebook',
		manufac: 'hp',
		owner: 'Petya',
		price: 1000,
		descrip: 'white',
		edit: false,
		mdelete: false
	}, {
		id: 12,
		name: 'phone',
		manufac: 'philips',
		owner: 'Petya',
		price: 500,
		descrip: 'red',
		edit: false,
		mdelete: false
	}];

	var List = _.template($('#table-template').html());
	var content = List({ 'data': myData });
	$('.tbody').html(content);
});
//# sourceMappingURL=script1.js.map