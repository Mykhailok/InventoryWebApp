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
		let list = _.template(htmlTableTemplate);
		let listContent = list({'data':data});
		tbody.innerHTML = listContent;
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
	let btnEditSave = document.getElementById('btnEditSave');
	let delBtn = document.getElementsByClassName('delBtn');
	let tbody = document.getElementById('tbody');
	let rows = tbody.getElementsByTagName('tr');
	let grid = document.getElementById('grid');
//слушаем клики по btnShowEditPage
	for (let i = 0; i < btnShowEditPage.length; i++) {
		btnShowEditPage[i].addEventListener("click", showEditPage,false);
	}
//слушаем клики по btnShowEditPage
	for (let i = 0; i < delBtn.length; i++) {
		delBtn[i].addEventListener("click", delRow,false);
	}
//слушаем клики по btnEditSave
	btnEditSave.addEventListener("click", EditSave,false);


//удаляем строки
//////////////////////////////////////////////////////////////////////////////
	function delRow() {
		let id = +this.getAttribute('data-value');
		// alert('delRow '+ id);
		let index;
		for (let i  in model.data) {
			if (model.data[i].id === id) {
				index = i;
			}
		}
		// alert('index '+ index);
		model.removeItem(index);
		let tr = this.parentNode.parentNode.parentNode;
		grid.deleteRow(tr.rowIndex);
	}

////////////////////////////////////////////////////////////////
//показываем станицу редактирования
	function showEditPage() {
		// alert('showEditPage');
		let id = +this.getAttribute('data-value');
		let index;
		for (let i  in model.data) {
			if (model.data[i].id === id) {
				index = i;
			}
		}
		inpID.value = myData[index].id;
		inpName.value = myData[index].name;
		inpManufac.value = myData[index].manufac;
		inpOwner.value = myData[index].owner;
		inpPrice.value = myData[index].price;
		inpDescrip.value = myData[index].descrip;
		wrapEdit.setAttribute('class', 'wrapEditVisible');
	}
//сохраняем изменения после редактирования
	 function EditSave() {
		wrapEdit.setAttribute('class','wrapEditHide');
		let id = +inpID.value ;
		let index ;
		for (let i  in model.data) {
			if (model.data[i].id === id) {
				index = i;
			}
		}
		let tempItem ={};

		//редактируем поля элемента
		tempItem.id = inpID.value;
		tempItem.name = inpName.value;
		tempItem.manufac = inpManufac.value;
		tempItem.owner = inpOwner.value;
		tempItem.price = inpPrice.value;
		tempItem.descrip = inpDescrip.value;
		model.editItem(tempItem, index);

//находим нужную строку
		for (let i=0; i < rows.length ; i++){
			if(+rows[i].getAttribute('data-value') === id){
				//находим поля строки
				let td = rows[i].getElementsByTagName('td');
				//перерисуем редактируемую строку
				td[0].innerHTML = inpID.value;
				td[1].innerHTML = inpName.value;
				td[2].innerHTML = inpManufac.value;
				td[3].innerHTML = inpOwner.value;
				td[4].innerHTML = inpPrice.value;
				td[5].innerHTML = inpDescrip.value;
			}
		}
	}
	grid.onclick = function (e) {
		if (e.target.tagName !== 'TH') return;

		// Если TH -- сортируем
		sortGrid(e.target.cellIndex, e.target.getAttribute('data-type'));
	};
	function sortGrid(colNum, type) {
		let ttbody = grid.getElementsByTagName('tbody')[0];

		// Составить массив из TR
		let rowsArray = [].slice.call(ttbody.rows);

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

		// Убрать ttbody из большого DOM документа для лучшей производительности
		grid.removeChild(ttbody);

		// добавить результат в нужном порядке в TBODY
		// они автоматически будут убраны со старых мест и вставлены в правильном порядке
		for (let i = 0; i < rowsArray.length; i++) {
			ttbody.appendChild(rowsArray[i]);
		}
		grid.appendChild(ttbody);
	}
}

////////////////////////////////////////////////////////////////
document.addEventListener("DOMContentLoaded", function () {
	let model = new Model(myData);
	let view = new View(model);
	let controller = new Controller(model,view);



});

