#include "totvs.ch"

/*/{Protheus.doc} User Function ADV004
    Rotina para montagem da tela de chamados do Axcadastro
    @type  Function
    @author mmartins
    @since 19/05/2023
    @version 1.1
    @see (https://tdn.totvs.com/pages/releaseview.action?pageId=23889136)
    @see (https://tdn.totvs.com/pages/releaseview.action?pageId=24346981)
    @History 22/05/2023, mmartins, fonte modificado para adicionar legendas.
    /*/
User Function ADV004()
/*
Axcadastro("ZZD","Cadastro de chamados")
*/
	Private cCadastro := "Cadastro de chamados"
	Private aRotina   := {}
	Private aCores    := {}

// Adiciono as rotinas para o browser
	aadd(aRotina, {"Pesquisa"                                         , "AxPesqui"   , 0, 1})
	aadd(aRotina, {"Visualizar"                                       , "AxVisual"   , 0, 2})
	aadd(aRotina, {"Incluir"                                          , "AxInclui"   , 0, 3})
	aadd(aRotina, {"Alterar"                                          , "AxAltera"   , 0, 4})
	aadd(aRotina, {"Excluir"                                          , "AxDeleta"   , 0, 5})
	aadd(aRotina, {"Legenda"                                          , "U_ADVLEG"   , 0, 6})

// Adiciono as coresr da legenda
	aadd(aCores , {"ZZD->ZZD_STATUS = '1' .OR. Empty(ZZD->ZZD_STATUS)", "BR_VERDE"})
	aadd(aCores , {"ZZD->ZZD_STATUS = '2' "                           , "BR_AZUL"})
	aadd(aCores , {"ZZD->ZZD_STATUS = '3' "                           , "BR_AMARELO"})
	aadd(aCores , {"ZZD->ZZD_STATUS = '4' "                           , "BR_PRETO"})
	aadd(aCores , {"ZZD->ZZD_STATUS = '5' "                           , "BR_VERMELHO"})

	mBrowse(6,1,22,75,"ZZD",,,,,,aCores)

Return

/*/{Protheus.doc} User Function ADVLEG
    Legenda dos chamados
    @type  Function
    @author mmartins
    @since 22/05/2023
    @version 1.0
    @see (https://terminaldeinformacao.com/knowledgebase/brwlegenda/)
    /*/
User Function ADVLEG()

    Local aLegenda := {}

    aadd(aLegenda, {"BR_VERDE"   , "Chamado em aberto"})
    aadd(aLegenda, {"BR_AZUL"    , "Chamado em atendimento"})
    aadd(aLegenda, {"BR_AMARELO" , "Chamado aguardando usuario"})
    aadd(aLegenda, {"BR_PRETO"   , "Chamado encerrado"})
    aadd(aLegenda, {"BR_VERMELHO", "Chamado em atraso"})

    BrwLegenda(cCadastro,"Legenda",aLegenda)
    
Return
