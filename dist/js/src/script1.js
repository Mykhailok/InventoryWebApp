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
	///////////////////////////////////////////////////////////////////////////
	//sort
	var grid = document.getElementById('grid');

	grid.onclick = function (e) {
		if (e.target.tagName != 'TH') return;

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