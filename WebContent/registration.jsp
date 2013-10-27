
<jsp:include page="header.jsp" />
<h1>Registration</h1>
<hr>
<p>To register for a UC3M Shop account, please fill out this form. Fields with a red asterisk are required.</p>
<br>
<form>
    <h4>Account Information: </h4><br/>
    <table  id="requiredInfo" cellpadding="3">
        <tr>
            <td align="right"><strong><font color="red">*</font>First name:</strong></td>
            <td><input type="text" name="fName" value=""></td>
            <td align="right"><strong><font color="red">*</font>Last name:</strong></td>
            <td><input type="text" name="lName" value=""></td>
        </tr>
        <tr>
            <td align="right"><strong><font color="red">*</font>Email:</strong></td>
            <td><input type="email" name="email" value=""></td>
            <td align="right"><strong><font color="red">*</font>Password:</strong></td>
            <td><input type="password" name="password" value=""></td>
        </tr>
    </table>
    <br>&nbsp;<br/>

    
    <table id="optionalInfo" cellpadding="3">
    
        <h4>Shipping Information: </h4><br/>
        <tr>
            <td align=right rowspan=2><strong>Address:</strong></td>
            <td><input type="email" name="address1" value=""></td>
        </tr>
        <tr>
            <td><input type="text" name="address2" value=""></td>
        </tr>
        <tr>
            <td align="right"><strong>City:</strong></td>
            <td><input type="text" name="city" value=""></td>
            <td align="right"><strong>State/Province:</strong></td>
            <td><input type="text" name="state" value=""></td>
        </tr>
        <tr>
            <td align="right"><strong>Postal code:</strong></td>
            <td><input type="text" name="zip" value=""></td>
            <td align="right"><strong>Country:</strong></td>
            <td><input type="text" name="country" value=""></td>
        </tr>
    </table>
    <br><br>
    <input style="margin-left:200px" type="submit" class="admin-button" value="Submit">
</form>

<jsp:include page="footer.jsp" />