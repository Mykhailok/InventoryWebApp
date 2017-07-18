/**
 * Created by Shishkov on 26.06.2017.
 */

'use strict';

var myData = void 0;
myData = [{
	id: 1,
	name: 'notebook',
	manufac: 'asus',
	owner: 'Masha',
	price: 1200,
	descrip: 'black'

}, {
	id: 2,
	name: 'notebook',
	manufac: 'hp',
	owner: 'Petya',
	price: 1000,
	descrip: 'white'
}, {
	id: 3,
	name: 'phone',
	manufac: 'philips',
	owner: 'Petya',
	price: 500,
	descrip: 'red'
}, {
	id: 4,
	name: 'notebook',
	manufac: 'asus',
	owner: 'Masha',
	price: 1200,
	descrip: 'black'
}, {
	id: 5,
	name: 'notebook',
	manufac: 'hp',
	owner: 'Petya',
	price: 1000,
	descrip: 'white'
}, {
	id: 6,
	name: 'phone',
	manufac: 'philips',
	owner: 'Petya',
	price: 500,
	descrip: 'red'
}, {
	id: 7,
	name: 'notebook',
	manufac: 'asus',
	owner: 'Masha',
	price: 1200,
	descrip: 'black'
}, {
	id: 8,
	name: 'notebook',
	manufac: 'hp',
	owner: 'Petya',
	price: 1000,
	descrip: 'white'
}, {
	id: 9,
	name: 'phone',
	manufac: 'philips',
	owner: 'Petya',
	price: 500,
	descrip: 'red'
}, {
	id: 10,
	name: 'notebook',
	manufac: 'asus',
	owner: 'Masha',
	price: 1200,
	descrip: 'black'

}, {
	id: 11,
	name: 'notebook',
	manufac: 'hp',
	owner: 'Petya',
	price: 1000,
	descrip: 'white'
}, {
	id: 12,
	name: 'phone',
	manufac: 'philips',
	owner: 'Petya',
	price: 500,
	descrip: 'red'
}, {
	id: 13,
	name: 'phone',
	manufac: 'philips',
	owner: 'Petya',
	price: 500,
	descrip: 'red'
}, {
	id: 14,
	name: 'notebook',
	manufac: 'asus',
	owner: 'Masha',
	price: 1200,
	descrip: 'black'

}, {
	id: 15,
	name: 'notebook',
	manufac: 'hp',
	owner: 'Petya',
	price: 1000,
	descrip: 'white'
}, {
	id: 16,
	name: 'phone',
	manufac: 'philips',
	owner: 'Petya',
	price: 500,
	descrip: 'red'
}, {
	id: 17,
	name: 'notebook',
	manufac: 'asus',
	owner: 'Masha',
	price: 1200,
	descrip: 'black'
}, {
	id: 18,
	name: 'notebook',
	manufac: 'hp',
	owner: 'Petya',
	price: 1000,
	descrip: 'white'
}, {
	id: 19,
	name: 'phone',
	manufac: 'philips',
	owner: 'Petya',
	price: 500,
	descrip: 'red'
}];

function Model(data) {
	var self = this;
	self.data = data.slice();
	self.editItem = function (item, index) {
		if (item.length === 0) {
			return;
		}
		console.log('1editItemModel');
		self.data[index].id = item.id;
		self.data[index].name = item.name;
		self.data[index].manufac = item.manufac;
		self.data[index].owner = item.owner;
		self.data[index].price = item.price;
		self.data[index].descrip = item.descrip;
		console.log('editItemModel self.data[index].name ' + self.data[index].name);
	};
	self.removeItem = function (index) {
		console.log('2removeItemModel');
		if (index === -1) {
			return;
		}
		self.data.splice(index, 1);
		return self.data;
	};
}
/////////////////////////////////////////////////////////////////
function View(model) {
	var self = this;
	function init() {
		self.renderList(model.data);
	}

	self.renderList = function (data) {
		var List = _.template($('#table-template').html());
		var content = List({ 'data': data });
		$('.tbody').html(content);
		console.log('3renderList');
	};
	init();
}
///////////////////////////////////////////////////////////////////////
function Controller(model, view) {
	var wrapEdit = document.getElementById('wrEdit');
	var inpID = document.getElementById('editId');
	var inpName = document.getElementById('editName');
	var inpManufac = document.getElementById('editManufac');
	var inpOwner = document.getElementById('editOwner');
	var inpPrice = document.getElementById('editPrice');
	var inpDescrip = document.getElementById('editDescrip');

	$('.btnShowEditPage').on('click', showEditPage);
	$('#btnEditSave').on('click', editSaveItem);
	$('.delBtn').on('click', removeItem);

	function showEditPage() {
		console.log('4showEditPageController');
		var index = this.getAttribute('data-value') - 1;
		inpID.value = myData[index].id;
		inpName.value = myData[index].name;
		inpManufac.value = myData[index].manufac;
		inpOwner.value = myData[index].owner;
		inpPrice.value = myData[index].price;
		inpDescrip.value = myData[index].descrip;
		wrapEdit.setAttribute('class', 'wrapEditVisible');
	}
	function editSaveItem() {
		console.log('5editSaveItemController');
		var index = inpID.value - 1;
		var tempItem = {};
		tempItem.id = inpID.value;
		tempItem.name = inpName.value;
		tempItem.manufac = inpManufac.value;
		tempItem.owner = inpOwner.value;
		tempItem.price = inpPrice.value;
		tempItem.descrip = inpDescrip.value;
		wrapEdit.setAttribute('class', 'wrapEditHide');
		model.editItem(tempItem, index);
		view.renderList(model.data);
	}

	function removeItem() {
		console.log('6removeItemController');
		var index = this.getAttribute('data-value') - 1;
		model.removeItem(index);
		view.renderList(model.data);
	}
}
////////////////////////////////////////////////////////////////


$(function () {
	var model = new Model(myData);
	var view = new View(model);
	var controller = new Controller(model, view);

	///////////////////////////////////////////////////////////////////////////
	//sort 
	var grid = document.getElementById('grid');

	grid.onclick = function (e) {
		if (e.target.tagName !== 'TH') return;

		// Если TH -- сортируем
		sortGrid(e.target.cellIndex, e.target.getAttribute('data-type'));
	};

	function sortGrid(colNum, type) {
		var tbody = grid.getElementsByTagName('tbody')[0];

		// Составить массив из TR
		var rowsArray = [].slice.call(tbody.rows);

		// определить функцию сравнения, в зависимости от типа
		var compare = void 0;

		switch (type) {
			case 'number':
				compare = function compare(rowA, rowB) {
					return rowA.cells[colNum].innerHTML - rowB.cells[colNum].innerHTML;
				};
				break;
			case 'string':
				compare = function compare(rowA, rowB) {
					return rowA.cells[colNum].innerHTML > rowB.cells[colNum].innerHTML ? 1 : -1;
				};
				break;
		}

		// сортировать
		rowsArray.sort(compare);

		// Убрать tbody из большого DOM документа для лучшей производительности
		grid.removeChild(tbody);

		// добавить результат в нужном порядке в TBODY
		// они автоматически будут убраны со старых мест и вставлены в правильном порядке
		for (var i = 0; i < rowsArray.length; i++) {
			tbody.appendChild(rowsArray[i]);
		}
		grid.appendChild(tbody);
	}
	////////////////////////////////////////////////////////////////////
});
//# sourceMappingURL=script1.js.map