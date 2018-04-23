Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If Session("CategoryID") IsNot Nothing Then
            ASPxCardView2.DataSource = dsProducts
            ASPxCardView2.DataBind()
        End If
    End Sub
    Protected Sub ASPxCardView2_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxCardViewCustomCallbackEventArgs)
        Dim masterKeyValue As Object = ASPxCardView1.GetCardValues(Convert.ToInt32(e.Parameters), "CategoryID")
        Session("CategoryID") = masterKeyValue
        ASPxCardView2.DataSource = dsProducts
        ASPxCardView2.PageIndex = 0
        ASPxCardView2.DataBind()

    End Sub
End Class