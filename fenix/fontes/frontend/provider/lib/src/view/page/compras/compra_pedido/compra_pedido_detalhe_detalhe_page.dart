/*
Title: T2Ti ERP Fenix                                                                
Description: AbaDetalhe DetalhePage relacionada à tabela [COMPRA_PEDIDO_DETALHE] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
Permission is hereby granted, free of charge, to any person                     
obtaining a copy of this software and associated documentation                  
files (the "Software"), to deal in the Software without                         
restriction, including without limitation the rights to use,                    
copy, modify, merge, publish, distribute, sublicense, and/or sell               
copies of the Software, and to permit persons to whom the                       
Software is furnished to do so, subject to the following                        
conditions:                                                                     
                                                                                
The above copyright notice and this permission notice shall be                  
included in all copies or substantial portions of the Software.                 
                                                                                
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                        
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT                     
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,                    
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING                    
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR                   
OTHER DEALINGS IN THE SOFTWARE.                                                 
                                                                                
       The author may be contacted at:                                          
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (alberteije@gmail.com)                    
@version 1.0.0
*******************************************************************************/
import 'package:flutter/material.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/infra/constantes.dart';
import 'compra_pedido_detalhe_persiste_page.dart';

class CompraPedidoDetalheDetalhePage extends StatefulWidget {
  final CompraPedido compraPedido;
  final CompraPedidoDetalhe compraPedidoDetalhe;

  const CompraPedidoDetalheDetalhePage({Key key, this.compraPedido, this.compraPedidoDetalhe})
      : super(key: key);

  @override
  _CompraPedidoDetalheDetalhePageState createState() =>
      _CompraPedidoDetalheDetalhePageState();
}

class _CompraPedidoDetalheDetalhePageState extends State<CompraPedidoDetalheDetalhePage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ViewUtilLib.getThemeDataDetalhePage(context),
        child: Scaffold(
          appBar: AppBar(title: Text('Compra Pedido Detalhe'), actions: <Widget>[
            IconButton(
              icon: ViewUtilLib.getIconBotaoExcluir(),
              onPressed: () {
                return ViewUtilLib.gerarDialogBoxExclusao(context, () {
                  widget.compraPedido.listaCompraPedidoDetalhe.remove(widget.compraPedidoDetalhe);
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                });
              },
            ),
            IconButton(
              icon: ViewUtilLib.getIconBotaoAlterar(),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            CompraPedidoDetalhePersistePage(
                                compraPedido: widget.compraPedido,
                                compraPedidoDetalhe: widget.compraPedidoDetalhe,
                                title: 'Compra Pedido Detalhe - Editando',
                                operacao: 'A')))
                    .then((_) {
                  setState(() {});
                });
              },
            ),
          ]),
          body: SingleChildScrollView(
            child: Theme(
              data: ThemeData(fontFamily: 'Raleway'),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
				  ViewUtilLib.getPaddingDetalhePage('Detalhes de CompraPedido'),
                  Card(
                    color: Colors.white,
                    elevation: 2.0,
                    child: Column(
                      children: <Widget>[
						ViewUtilLib.getListTileDataDetalhePage(
							widget.compraPedidoDetalhe.produto?.nome?.toString() ?? '', 'Produto'),
						ViewUtilLib.getListTileDataDetalhePage(
							widget.compraPedidoDetalhe.quantidade != null ? Constantes.formatoDecimalQuantidade.format(widget.compraPedidoDetalhe.quantidade) : 0.toStringAsFixed(Constantes.decimaisQuantidade), 'Quantidade'),
						ViewUtilLib.getListTileDataDetalhePage(
							widget.compraPedidoDetalhe.valorUnitario != null ? Constantes.formatoDecimalValor.format(widget.compraPedidoDetalhe.valorUnitario) : 0.toStringAsFixed(Constantes.decimaisValor), 'Valor Unitário'),
						ViewUtilLib.getListTileDataDetalhePage(
							widget.compraPedidoDetalhe.valorSubtotal != null ? Constantes.formatoDecimalValor.format(widget.compraPedidoDetalhe.valorSubtotal) : 0.toStringAsFixed(Constantes.decimaisValor), 'Valor Subtotal'),
						ViewUtilLib.getListTileDataDetalhePage(
							widget.compraPedidoDetalhe.taxaDesconto != null ? Constantes.formatoDecimalTaxa.format(widget.compraPedidoDetalhe.taxaDesconto) : 0.toStringAsFixed(Constantes.decimaisTaxa), 'Taxa Desconto'),
						ViewUtilLib.getListTileDataDetalhePage(
							widget.compraPedidoDetalhe.valorDesconto != null ? Constantes.formatoDecimalValor.format(widget.compraPedidoDetalhe.valorDesconto) : 0.toStringAsFixed(Constantes.decimaisValor), 'Valor Desconto'),
						ViewUtilLib.getListTileDataDetalhePage(
							widget.compraPedidoDetalhe.valorTotal != null ? Constantes.formatoDecimalValor.format(widget.compraPedidoDetalhe.valorTotal) : 0.toStringAsFixed(Constantes.decimaisValor), 'Valor Total'),
						ViewUtilLib.getListTileDataDetalhePage(
							widget.compraPedidoDetalhe.cst ?? '', 'CST'),
						ViewUtilLib.getListTileDataDetalhePage(
							widget.compraPedidoDetalhe.csosn ?? '', 'CSOSN'),
						ViewUtilLib.getListTileDataDetalhePage(
							widget.compraPedidoDetalhe.cfop?.toString() ?? '', 'CFOP'),
						ViewUtilLib.getListTileDataDetalhePage(
							widget.compraPedidoDetalhe.valorIcms != null ? Constantes.formatoDecimalValor.format(widget.compraPedidoDetalhe.valorIcms) : 0.toStringAsFixed(Constantes.decimaisValor), 'Valor do ICMS'),
						ViewUtilLib.getListTileDataDetalhePage(
							widget.compraPedidoDetalhe.valorIpi != null ? Constantes.formatoDecimalValor.format(widget.compraPedidoDetalhe.valorIpi) : 0.toStringAsFixed(Constantes.decimaisValor), 'Valor do IPI'),
						ViewUtilLib.getListTileDataDetalhePage(
							widget.compraPedidoDetalhe.aliquotaIcms != null ? Constantes.formatoDecimalTaxa.format(widget.compraPedidoDetalhe.aliquotaIcms) : 0.toStringAsFixed(Constantes.decimaisTaxa), 'Alíquota do ICMS'),
						ViewUtilLib.getListTileDataDetalhePage(
							widget.compraPedidoDetalhe.aliquotaIpi != null ? Constantes.formatoDecimalTaxa.format(widget.compraPedidoDetalhe.aliquotaIpi) : 0.toStringAsFixed(Constantes.decimaisTaxa), 'Alíquota do IPI'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
