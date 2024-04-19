let lista = [ 2, 0, 2, 3, 1, 9, 8, 7 ] 

function insertionSort(lista) {
	let _lista = [...lista] 
	for (let i = 0; i < _lista.length; i++) {
		for(let j = i; j < _lista.length; j++) {
			if (_lista[i] > _lista[j]) {
				let temp  = _lista[i]
				_lista[i] = _lista[j]
				_lista[j] = temp
        debugger 
			}
		}
	}
	return _lista
}

console.log(lista) 
console.log(insertionSort(lista))
//console.log(lista.sort())
