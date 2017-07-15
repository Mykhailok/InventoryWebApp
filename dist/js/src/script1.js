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
var grid = document.getElementById('grid');
var tbody = document.getElementById('tbody');
var rows = tbody.getElementsByTagName('tr');
function Model(data) {
	var self = this;
	self.data = data.slice();
	self.editItem = function (item, index) {
		if (item.length === 0) {
			return;
		}
		self.data[index].id = item.id;
		self.data[index].name = item.name;
		self.data[index].manufac = item.manufac;
		self.data[index].owner = item.owner;
		self.data[index].price = item.price;
		self.data[index].descrip = item.descrip;
	};
	self.removeItem = function (index) {
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
		var htmlTableTemplate = document.getElementById('table-template').innerHTML;
		// let tbody = document.getElementsByClassName('ttbody');//НЕ РАБОТАЕТ
		var list = _.template(htmlTableTemplate);
		var listContent = list({ 'data': data });
		tbody.innerHTML = listContent;
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
	var btnShowEditPage = document.getElementsByClassName('btnShowEditPage');
	var btnEditSave = document.getElementById('btnEditSave');
	var delBtn = document.getElementsByClassName('delBtn');

	//удаляем строки

	var _loop = function _loop(i) {
		delBtn[i].addEventListener('click', function () {
			var id = +delBtn[i].getAttribute('data-value');
			var index = void 0;
			for (var _i2 in model.data) {
				if (model.data[_i2].id === id) {
					index = _i2;
				}
			}
			model.removeItem(index);
			var tr = delBtn[i].parentNode.parentNode.parentNode;
			grid.deleteRow(tr.rowIndex);
		});
	};

	for (var i = 0; i < delBtn.length; i++) {
		_loop(i);
	}
	//показываем станицу редактирования

	var _loop2 = function _loop2(i) {
		btnShowEditPage[i].addEventListener('click', function () {
			var id = +btnShowEditPage[i].getAttribute('data-value');
			var index = void 0;
			for (var _i3 in model.data) {
				if (model.data[_i3].id === id) {
					index = _i3;
				}
			}
			inpID.value = myData[index].id;
			inpName.value = myData[index].name;
			inpManufac.value = myData[index].manufac;
			inpOwner.value = myData[index].owner;
			inpPrice.value = myData[index].price;
			inpDescrip.value = myData[index].descrip;
			wrapEdit.setAttribute('class', 'wrapEditVisible');
		});
	};

	for (var i = 0; i < btnShowEditPage.length; i++) {
		_loop2(i);
	}
	//сохраняем изменения после редактирования
	btnEditSave.onclick = function EditSave() {
		wrapEdit.setAttribute('class', 'wrapEditHide');
		var id = +inpID.value;
		var index = void 0;
		for (var i in model.data) {
			if (model.data[i].id === id) {
				index = i;
			}
		}
		var tempItem = {};

		//редактируем поля элемента
		tempItem.id = inpID.value;
		tempItem.name = inpName.value;
		tempItem.manufac = inpManufac.value;
		tempItem.owner = inpOwner.value;
		tempItem.price = inpPrice.value;
		tempItem.descrip = inpDescrip.value;
		model.editItem(tempItem, index);

		//находим нужную строку
		for (var _i = 0; _i < rows.length; _i++) {
			if (+rows[_i].getAttribute('data-value') === id) {
				//находим поля строки
				var td = rows[_i].getElementsByTagName('td');
				//перерисуем редактируемую строку
				td[0].innerHTML = inpID.value;
				td[1].innerHTML = inpName.value;
				td[2].innerHTML = inpManufac.value;
				td[3].innerHTML = inpOwner.value;
				td[4].innerHTML = inpPrice.value;
				td[5].innerHTML = inpDescrip.value;
			}
		}
	};
}
////////////////////////////////////////////////////////////////
document.addEventListener("DOMContentLoaded", function () {
	var model = new Model(myData);
	var view = new View(model);
	var controller = new Controller(model, view);

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
});
//# sourceMappingURL=script1.js.map