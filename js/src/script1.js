/**
 * Created by Shishkov on 26.06.2017.
 */

'use strict';
let myData;
myData =[

	{
		id:1,
		name:'notebook',
		manufac:'asus',
		owner:'Masha',
		price:1200,
		descrip:'black'

	},
	{
		id:2,
		name:'notebook',
		manufac:'hp',
		owner:'Petya',
		price:1000,
		descrip:'white'
	},
	{
		id:3,
		name:'phone',
		manufac:'philips',
		owner:'Petya',
		price:500,
		descrip:'red'
	},
	{
		id:4,
		name:'notebook',
		manufac:'asus',
		owner:'Masha',
		price:1200,
		descrip:'black'
	},
	{
		id:5,
		name:'notebook',
		manufac:'hp',
		owner:'Petya',
		price:1000,
		descrip:'white'
	},
	{
		id:6,
		name:'phone',
		manufac:'philips',
		owner:'Petya',
		price:500,
		descrip:'red'
	},
	{
		id:7,
		name:'notebook',
		manufac:'asus',
		owner:'Masha',
		price:1200,
		descrip:'black'
	},
	{
		id:8,
		name:'notebook',
		manufac:'hp',
		owner:'Petya',
		price:1000,
		descrip:'white'
	},
	{
		id:9,
		name:'phone',
		manufac:'philips',
		owner:'Petya',
		price:500,
		descrip:'red'
	},
	{
		id:10,
		name:'notebook',
		manufac:'asus',
		owner:'Masha',
		price:1200,
		descrip:'black'

	},
	{
		id:11,
		name:'notebook',
		manufac:'hp',
		owner:'Petya',
		price:1000,
		descrip:'white'
	},
	{
		id:12,
		name:'phone',
		manufac:'philips',
		owner:'Petya',
		price:500,
		descrip:'red'
	},
	{
		id:13,
		name:'phone',
		manufac:'philips',
		owner:'Petya',
		price:500,
		descrip:'red'
	},
	{
		id:14,
		name:'notebook',
		manufac:'asus',
		owner:'Masha',
		price:1200,
		descrip:'black'

	},
	{
		id:15,
		name:'notebook',
		manufac:'hp',
		owner:'Petya',
		price:1000,
		descrip:'white'
	},
	{
		id:16,
		name:'phone',
		manufac:'philips',
		owner:'Petya',
		price:500,
		descrip:'red'
	},
	{
		id:17,
		name:'notebook',
		manufac:'asus',
		owner:'Masha',
		price:1200,
		descrip:'black'
	},
	{
		id:18,
		name:'notebook',
		manufac:'hp',
		owner:'Petya',
		price:1000,
		descrip:'white'
	},
	{
		id:19,
		name:'phone',
		manufac:'philips',
		owner:'Petya',
		price:500,
		descrip:'red'
	}

];

function Model(data) {
	let self = this;
	self.data = data.slice();
	self.editItem = function (item,index) {
		if (item.length === 0) {
			return;
		}
		// alert ('1editItemModel');
		self.data[index].id = item.id;
		self.data[index].name = item.name;
		self.data[index].manufac = item.manufac;
		self.data[index].owner = item.owner;
		self.data[index].price = item.price;
		self.data[index].descrip = item.descrip;
		// alert('editItemModel self.data[index].name '+ self.data[index].name);
	};
	self.removeItem = function (index) {
		// alert ('2removeItemModel');
		if (index === -1) {
			return;
		}
		self.data.splice(index,1);
		return self.data;
	};
}
/////////////////////////////////////////////////////////////////
function View(model) {
	let self = this;
	function init() {
		self.renderList(model.data);
	}

	self.renderList = function (data) {
		let htmlTableTemplate = document.getElementById('table-template').innerHTML;
		// let tbody = document.getElementsByClassName('ttbody');//НЕ РАБОТАЕТ
		let tbody = document.getElementById('tbody');
		let List = _.template(htmlTableTemplate);
		let content = List({'data':data});
		tbody.innerHTML = content;
		// alert ('3renderList');
	};
	init();
}
///////////////////////////////////////////////////////////////////////
function Controller(model,view) {
	let wrapEdit = document.getElementById('wrEdit');
	let inpID = document.getElementById('editId');
	let inpName = document.getElementById('editName');
	let inpManufac = document.getElementById('editManufac');
	let inpOwner = document.getElementById('editOwner');
	let inpPrice = document.getElementById('editPrice');
	let inpDescrip = document.getElementById('editDescrip');
	let btnShowEditPage = document.getElementsByClassName('btnShowEditPage');
	// alert('btnShowEditPage.length'+ btnShowEditPage.length);
	let btnEditSave = document.getElementById('btnEditSave');
	let delBtn = document.getElementsByClassName('delBtn');

	for (let i = 0; i < btnShowEditPage.length; i++) {
		btnShowEditPage[i].addEventListener('click', function () {
			let index = btnShowEditPage[i].getAttribute('data-value')-1;
			inpID.value = myData[index].id;
			inpName.value = myData[index].name;
			inpManufac.value = myData[index].manufac;
			inpOwner.value = myData[index].owner;
			inpPrice.value = myData[index].price;
			inpDescrip.value = myData[index].descrip;
			wrapEdit.setAttribute('class','wrapEditVisible');
		})
	}



	btnEditSave.onclick = function () {
		// alert ('5editSaveItemController');
		let index = inpID.value - 1;
		let tempItem ={};
		tempItem.id = inpID.value;
		tempItem.name = inpName.value;
		tempItem.manufac = inpManufac.value;
		tempItem.owner = inpOwner.value;
		tempItem.price = inpPrice.value;
		tempItem.descrip = inpDescrip.value;
		wrapEdit.setAttribute('class','wrapEditHide');
		model.editItem(tempItem, index);
		view.renderList(model.data);
	};


	for (let i = 0; i < delBtn.length; i++) {
		delBtn[i].addEventListener('click',function () {
				let index = delBtn[i].getAttribute('data-value')-1;
				model.removeItem(index);
				view.renderList(model.data);
			// alert ('This is delBtn.length'+ delBtn.length);
		});
	}

}
////////////////////////////////////////////////////////////////


$(function () {
	let model = new Model(myData);
	let view = new View(model);
	let controller = new Controller(model,view);

///////////////////////////////////////////////////////////////////////////
	//sort
	let grid = document.getElementById('grid');
	grid.onclick = function(e) {
		if (e.target.tagName !== 'TH') return;

		// Если TH -- сортируем
		sortGrid(e.target.cellIndex, e.target.getAttribute('data-type'));
	};
	function sortGrid(colNum, type) {
		let tbody = grid.getElementsByTagName('tbody')[0];

		// Составить массив из TR
		let rowsArray = [].slice.call(tbody.rows);

		// определить функцию сравнения, в зависимости от типа
		let compare;

		switch (type) {
			case 'number':
				compare = function(rowA, rowB) {
					return rowA.cells[colNum].innerHTML - rowB.cells[colNum].innerHTML;
				};
				break;
			case 'string':
				compare = function(rowA, rowB) {
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
		for (let i = 0; i < rowsArray.length; i++) {
			tbody.appendChild(rowsArray[i]);
		}
		grid.appendChild(tbody);
	}
////////////////////////////////////////////////////////////////////

});