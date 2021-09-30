
/*
 * API do Cartório 
 *
 * No momento a gente só tá casando gente. 
 * 
 * @param  {string} seuNome
 * @param  {string} nomeDaOutraPessoa
 * @return {string} contratoDeCasamento
 *
 */

function casorio(seuNome, nomeDaOutraPessoa) {

  const geradoEmData = new Date().toLocaleString()


  return `

    Esse documento atesta que ${seuNome} se casou com
    ${nomeDaOutraPessoa} na data ${geradoEmData}.

    Pronto, vocês tão casados. 
  
  `
}

module.exports = { casorio } 

