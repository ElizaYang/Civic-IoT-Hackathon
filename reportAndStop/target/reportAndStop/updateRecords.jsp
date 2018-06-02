<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.reportAndStop.bean.Record"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Record Page</title>
    </head>
    <body>
        <form method="POST" action="updateRecords">
            <table>
                <tr>
                    <td>Case Id</td>
                    <td><input name="_id" type="text" value="${selectedRecord.id}"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input name="name" type="text" value="${selectedRecord.name}"></td>
                </tr>
                <tr>
                    <td>Surname</td>
                    <td><input name="dateTime" type="text" value="${selectedRecord.dateTime}"></td>
                </tr>
                <tr>
                    <td>Type</td>
                    <td><input name="type" type="text" value="${selectedRecord.type}"></td>
                </tr>
                <tr>
                    <td>Location</td>
                    <td><input name="location" type="text" value="${selectedRecord.location}"></td>
                </tr>
                <tr>
                    <td>suspGender</td>
                    <td><input name="suspGender" type="text" value="${selectedRecord.suspGender}"></td>
                </tr>
                <tr>
                    <td>suspRace</td>
                    <td><input name="suspRace" type="text" value="${selectedRecord.suspRace}"></td>
                </tr>
                <tr>
                    <td>suspAge</td>
                    <td><input name="suspAge" type="text" value="${selectedRecord.suspAge}"></td>
                </tr>
                <tr>
                    <td>suspHeight</td>
                    <td><input name="suspHeight" type="text" value="${selectedRecord.suspHeight}"></td>
                </tr>
                <tr>
                    <td>suspWeight</td>
                    <td><input name="suspWeight" type="text" value="${selectedRecord.suspWeight}"></td>
                </tr>
                <tr>
                    <td>suspChar</td>
                    <td><input name="suspChar" type="text" value="${selectedRecord.suspChar}"></td>
                </tr>
                <tr>
                    <td>contact</td>
                    <td><input name="contact" type="text" value="${selectedRecord.contact}"></td>
                </tr>
				<tr>
                    <td>invest</td>
                    <td><input name="invest" type="text" value="${selectedRecord.invest}"></td>
                </tr>

                <tr>
                    <td><input type="submit" value="Update Record"></td>
                </tr>
                
            </table>            
						
						
        </form>
    </body>
</html>
