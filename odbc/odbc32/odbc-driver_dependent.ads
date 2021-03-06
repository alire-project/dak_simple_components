--                                                                    --
--  package                         Copyright (c)  Dmitry A. Kazakov  --
--     ODBC.Driver_Dependent                       Luebeck            --
--  Interface                                      Autumn, 2012       --
--                                                                    --
--                                Last revision :  14:24 11 Feb 2012  --
--                                                                    --
--  This  library  is  free software; you can redistribute it and/or  --
--  modify it under the terms of the GNU General Public  License  as  --
--  published by the Free Software Foundation; either version  2  of  --
--  the License, or (at your option) any later version. This library  --
--  is distributed in the hope that it will be useful,  but  WITHOUT  --
--  ANY   WARRANTY;   without   even   the   implied   warranty   of  --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU  --
--  General  Public  License  for  more  details.  You  should  have  --
--  received  a  copy  of  the GNU General Public License along with  --
--  this library; if not, write to  the  Free  Software  Foundation,  --
--  Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.    --
--                                                                    --
--  As a special exception, if other files instantiate generics from  --
--  this unit, or you link this unit with other files to produce  an  --
--  executable, this unit does not by  itself  cause  the  resulting  --
--  executable to be covered by the GNU General Public License. This  --
--  exception  does not however invalidate any other reasons why the  --
--  executable file might be covered by the GNU Public License.       --
--____________________________________________________________________--

with Interfaces.C;          use Interfaces.C;
with Interfaces.C.Strings;  use Interfaces.C.Strings;
with ODBC.SQLTypes;         use ODBC.SQLTypes;

pragma Elaborate_All (ODBC.SQLTypes);

package ODBC.Driver_Dependent is

   function SQLAllocHandle
            (  HandleType      : SQL_HANDLE;
               InputHandle     : SQLHANDLE;
               OutputHandlePtr : access SQLHANDLE
            )  return SQLRETURN;

   function SQLBindCol
            (  StatementHandle : SQLHSTMT;
               ColumnNumber    : SQLUSMALLINT;
               TargetType      : SQL_C_DATA_TYPE;
               TargetValuePtr  : SQLPOINTER;
               BufferLength    : SQLLEN;
               StrLen_or_Ind   : access SQLLEN
            )  return SQLRETURN;

   function SQLBindParameter
            (  StatementHandle   : SQLHSTMT;
               ParameterNumber   : SQLUSMALLINT;
               InputOutputType   : SQL_PARAM;
               ValueType         : SQL_C_DATA_TYPE;
               ParameterType     : SQL_DATA_TYPE;
               ColumnSize        : SQLULEN;
               DecimalDigits     : SQLSMALLINT;
               ParameterValuePtr : SQLPOINTER;
               BufferLength      : SQLLEN;
               StrLen_or_IndPtr  : access SQLLEN
            )  return SQLRETURN;

   function SQLBrowseConnect
            (  ConnectionHandle    : SQLHDBC;
               InConnectionString  : char_array;
               StringLength1       : SQLSMALLINT;
               OutConnectionString : access char;
               BufferLength        : SQLSMALLINT;
               StringLength2Ptr    : access SQLSMALLINT
            )  return SQLRETURN;

   function SQLBrowseConnectW
            (  ConnectionHandle    : SQLHDBC;
               InConnectionString  : char_array;
               StringLength1       : SQLSMALLINT;
               OutConnectionString : access SQLWCHAR;
               BufferLength        : SQLSMALLINT;
               StringLength2Ptr    : access SQLSMALLINT
            )  return SQLRETURN;

   function SQLBulkOperations
            (  StatementHandle : SQLHSTMT;
               Operation       : SQLUSMALLINT
            )  return SQLRETURN;

   function SQLCancel (StatementHandle : SQLHSTMT) return SQLRETURN;

   function SQLCancelHandle
            (  HandleType : SQL_HANDLE;
               Handle     : SQLHANDLE
            )  return SQLRETURN;

   function SQLCloseCursor
            (  StatementHandle : SQLHSTMT
            )  return SQLRETURN;

   function SQLColAttribute
            (  StatementHandle       : SQLHSTMT;
               ColumnNumber          : SQLUSMALLINT;
               FieldIdentifier       : SQL_DESC;
               CharacterAttributePtr : SQLPOINTER;
               BufferLength          : SQLSMALLINT;
               StringLengthPtr       : access SQLSMALLINT;
               NumericAttributePtr   : access SQLLEN
            )  return SQLRETURN;

   function SQLColAttributeW
            (  StatementHandle       : SQLHSTMT;
               ColumnNumber          : SQLUSMALLINT;
               FieldIdentifier       : SQL_DESC;
               CharacterAttributePtr : access SQLWCHAR;
               BufferLength          : SQLSMALLINT;
               StringLengthPtr       : access SQLSMALLINT;
               NumericAttributePtr   : access SQLLEN
            )  return SQLRETURN;

   function SQLColumnPrivileges
            (  StatementHandle : SQLHSTMT;
               CatalogName     : char_Ptr    := null;
               NameLength1     : SQLSMALLINT := 0;
               SchemaName      : char_Ptr    := null;
               NameLength2     : SQLSMALLINT := 0;
               TableName       : char_Ptr    := null;
               NameLength3     : SQLSMALLINT := 0;
               ColumnName      : char_Ptr    := null;
               NameLength4     : SQLSMALLINT := 0
            )  return SQLRETURN;

   function SQLColumnPrivilegesW
            (  StatementHandle : SQLHSTMT;
               CatalogName     : SQLWCHAR_Ptr := null;
               NameLength1     : SQLSMALLINT  := 0;
               SchemaName      : SQLWCHAR_Ptr := null;
               NameLength2     : SQLSMALLINT  := 0;
               TableName       : SQLWCHAR_Ptr := null;
               NameLength3     : SQLSMALLINT  := 0;
               ColumnName      : SQLWCHAR_Ptr := null;
               NameLength4     : SQLSMALLINT  := 0
            )  return SQLRETURN;

   function SQLColumns
            (  StatementHandle : SQLHSTMT;
               CatalogName     : char_Ptr    := null;
               NameLength1     : SQLSMALLINT := 0;
               SchemaName      : char_Ptr    := null;
               NameLength2     : SQLSMALLINT := 0;
               TableName       : char_Ptr    := null;
               NameLength3     : SQLSMALLINT := 0;
               ColumnName      : char_Ptr    := null;
               NameLength4     : SQLSMALLINT := 0
            )  return SQLRETURN;

   function SQLColumnsW
            (  StatementHandle : SQLHSTMT;
               CatalogName     : SQLWCHAR_Ptr := null;
               NameLength1     : SQLSMALLINT  := 0;
               SchemaName      : SQLWCHAR_Ptr := null;
               NameLength2     : SQLSMALLINT  := 0;
               TableName       : SQLWCHAR_Ptr := null;
               NameLength3     : SQLSMALLINT  := 0;
               ColumnName      : SQLWCHAR_Ptr := null;
               NameLength4     : SQLSMALLINT := 0
            )  return SQLRETURN;

   function SQLCompleteAsync
            (  HandleType      : SQL_HANDLE;
               Handle          : SQLHANDLE;
               AsyncRetCodePtr : access RETCODE
            )  return SQLRETURN;

   function SQLConnect
            (  ConnectionHandle : SQLHDBC;
               ServerName       : char_array;
               NameLength1      : SQLSMALLINT;
               UserName         : char_array;
               NameLength2      : SQLSMALLINT;
               Authentication   : char_array;
               NameLength3      : SQLSMALLINT
            )  return SQLRETURN;

   function SQLConnectW
            (  ConnectionHandle : SQLHDBC;
               ServerName       : SQLWCHAR_Array;
               NameLength1      : SQLSMALLINT;
               UserName         : SQLWCHAR_Array;
               NameLength2      : SQLSMALLINT;
               Authentication   : SQLWCHAR_Array;
               NameLength3      : SQLSMALLINT
            )  return SQLRETURN;

   function SQLCopyDesc
            (  SourceDescHandle : SQLHDESC;
               TargetDescHandle : SQLHDESC
            )  return SQLRETURN;

   function SQLDataSources
            (  EnvironmentHandle : SQLHENV;
               Direction         : SQL_DIRECTION;
               ServerName        : access char;
               BufferLength1     : SQLSMALLINT;
               NameLength1Ptr    : access SQLSMALLINT;
               Description       : access char;
               BufferLength2     : SQLSMALLINT;
               NameLength2Ptr    : access SQLSMALLINT
            )  return SQLRETURN;

   function SQLDataSourcesW
            (  EnvironmentHandle : SQLHENV;
               Direction         : SQL_DIRECTION;
               ServerName        : access SQLWCHAR;
               BufferLength1     : SQLSMALLINT;
               NameLength1Ptr    : access SQLSMALLINT;
               Description       : access SQLWCHAR;
               BufferLength2     : SQLSMALLINT;
               NameLength2Ptr    : access SQLSMALLINT
            )  return SQLRETURN;

   function SQLDescribeCol
            (  StatementHandle  : SQLHSTMT;
               ColumnNumber     : SQLUSMALLINT;
               ColumnName       : access char;
               BufferLength     : SQLSMALLINT;
               NameLengthPtr    : access SQLSMALLINT;
               DataTypePtr      : access SQL_DATA_TYPE;
               ColumnSizePtr    : access SQLULEN;
               DecimalDigitsPtr : access SQLSMALLINT;
               NullablePtr      : access SQL_NULLABLE_FIELD
            )  return SQLRETURN;

   function SQLDescribeCol
            (  StatementHandle  : SQLHSTMT;
               ColumnNumber     : SQLUSMALLINT;
               ColumnName       : chars_ptr   := Null_Ptr;
               BufferLength     : SQLSMALLINT := 0;
               NameLengthPtr    : access SQLSMALLINT;
               DataTypePtr      : access SQL_DATA_TYPE;
               ColumnSizePtr    : access SQLULEN;
               DecimalDigitsPtr : access SQLSMALLINT;
               NullablePtr      : access SQL_NULLABLE_FIELD
            )  return SQLRETURN;

   function SQLDescribeParam
            (  StatementHandle  : SQLHSTMT;
               ParameterNumber  : SQLUSMALLINT;
               DataTypePtr      : access SQL_DATA_TYPE;
               ParameterSizePtr : access SQLULEN;
               DecimalDigitsPtr : access SQLSMALLINT;
               NullablePtr      : access SQL_NULLABLE_FIELD
            )  return SQLRETURN;

   function SQLDisconnect (ConnectionHandle : SQLHDBC) return SQLRETURN;

   function SQLDriverConnect
            (  ConnectionHandle    : SQLHDBC;
               WindowHandle        : SQLHWND;
               InConnectionString  : char_array;
               StringLength1       : SQLSMALLINT;
               OutConnectionString : char_array;
               BufferLength        : SQLSMALLINT;
               StringLength2Ptr    : access SQLSMALLINT;
               DriverCompletion    : SQLUSMALLINT
            )  return SQLRETURN;

   function SQLDrivers
            (  EnvironmentHandle    : SQLHENV;
               Direction            : SQL_DRIVER_DIRECTION;
               DriverDescription    : access SQLCHAR;
               BufferLength1        : SQLSMALLINT;
               DescriptionLengthPtr : access SQLSMALLINT;
               DriverAttributes     : access SQLCHAR;
               BufferLength2        : SQLSMALLINT;
               AttributesLengthPtr  : access SQLSMALLINT
            )  return SQLRETURN;

   function SQLEndTran
            (  HandleType     : SQL_HANDLE;
               Handle         : SQLHANDLE;
               CompletionType : SQL_COMPLETION
            )  return SQLRETURN;

   function SQLExecDirect
            (  StatementHandle : SQLHSTMT;
               StatementText   : char_array;
               TextLength      : SQLINTEGER
            )  return SQLRETURN;

   function SQLExecDirectW
            (  StatementHandle : SQLHSTMT;
               StatementText   : SQLWCHAR_Array;
               TextLength      : SQLINTEGER
            )  return SQLRETURN;

   function SQLExecute (StatementHandle : SQLHSTMT) return SQLRETURN;

   function SQLExtendedFetch
            (  StatementHandle  : SQLHSTMT;
               FetchOrientation : SQL_DIRECTION;
               FetchOffset      : SQLLEN;
               RowCountPtr      : access SQLULEN;
               RowStatusArray   : access SQLUSMALLINT
            )  return SQLRETURN;

   function SQLFetch (StatementHandle : SQLHSTMT) return SQLRETURN;

   function SQLFetchScroll
            (  StatementHandle  : SQLHSTMT;
               FetchOrientation : SQL_DIRECTION;
               FetchOffset      : SQLLEN
            )  return SQLRETURN;

   function SQLForeignKeys
            (  StatementHandle : SQLHSTMT;
               PKCatalogName   : char_Ptr    := null;
               NameLength1     : SQLSMALLINT := 0;
               PKSchemaName    : char_Ptr    := null;
               NameLength2     : SQLSMALLINT := 0;
               PKTableName     : char_Ptr    := null;
               NameLength3     : SQLSMALLINT := 0;
               FKCatalogName   : char_Ptr    := null;
               NameLength4     : SQLSMALLINT := 0;
               FKSchemaName    : char_Ptr    := null;
               NameLength5     : SQLSMALLINT := 0;
               FKTableName     : char_Ptr    := null;
               NameLength6     : SQLSMALLINT := 0
            )  return SQLRETURN;

   function SQLForeignKeysW
            (  StatementHandle : SQLHSTMT;
               PKCatalogName   : SQLWCHAR_Ptr := null;
               NameLength1     : SQLSMALLINT  := 0;
               PKSchemaName    : SQLWCHAR_Ptr := null;
               NameLength2     : SQLSMALLINT  := 0;
               PKTableName     : SQLWCHAR_Ptr := null;
               NameLength3     : SQLSMALLINT  := 0;
               FKCatalogName   : SQLWCHAR_Ptr := null;
               NameLength4     : SQLSMALLINT  := 0;
               FKSchemaName    : SQLWCHAR_Ptr := null;
               NameLength5     : SQLSMALLINT  := 0;
               FKTableName     : SQLWCHAR_Ptr := null;
               NameLength6     : SQLSMALLINT  := 0
            )  return SQLRETURN;

   function SQLFreeHandle
            (  HandleType : SQL_HANDLE;
               Handle     : SQLHANDLE
            )  return SQLRETURN;

   function SQLFreeStmt
            (  StatementHandle : SQLHSTMT;
               Option          : SQL_OPTION
            )  return SQLRETURN;

   function SQLGetConnectAttr
            (  ConnectionHandle : SQLHDBC;
               Attribute        : SQL_ATTR;
               ValuePtr         : SQLPOINTER;
               BufferLength     : SQLINTEGER;
               StringLengthPtr  : access SQLINTEGER
            )  return SQLRETURN;

   function SQLGetConnectAttr
            (  ConnectionHandle : SQLHDBC;
               Attribute        : SQL_ATTR;
               ValuePtr         : chars_ptr  := null_ptr;
               BufferLength     : SQLINTEGER := 0;
               StringLengthPtr  : access SQLINTEGER
            )  return SQLRETURN;

   function SQLGetConnectAttr
            (  ConnectionHandle : SQLHDBC;
               Attribute        : SQL_ATTR;
               ValuePtr         : access char;
               BufferLength     : SQLINTEGER;
               StringLengthPtr  : access SQLINTEGER
            )  return SQLRETURN;

   function SQLGetConnectAttrW
            (  ConnectionHandle : SQLHDBC;
               Attribute        : SQL_ATTR;
               ValuePtr         : access SQLWCHAR;
               BufferLength     : SQLINTEGER;
               StringLengthPtr  : access SQLINTEGER
            )  return SQLRETURN;

   function SQLGetCursorName
            (  StatementHandle : SQLHSTMT;
               CursorName      : char_array;
               BufferLength    : SQLSMALLINT;
               NameLengthPtr   : access SQLSMALLINT
            )  return SQLRETURN;

   function SQLGetCursorNameW
            (  StatementHandle : SQLHSTMT;
               CursorName      : SQLWCHAR_Array;
               BufferLength    : SQLSMALLINT;
               NameLengthPtr   : access SQLSMALLINT
            )  return SQLRETURN;

   function SQLGetData
            (  StatementHandle  : SQLHSTMT;
               Col_or_Param_Num : SQLUSMALLINT;
               TargetType       : SQL_C_DATA_TYPE;
               TargetValuePtr   : SQLPOINTER;
               BufferLength     : SQLLEN;
               StrLen_or_IndPtr : access SQLLEN
            )  return SQLRETURN;

   function SQLGetDescField
            (  DescriptorHandle : SQLHDESC;
               RecNumber        : SQLSMALLINT;
               FieldIdentifier  : SQL_DESC;
               ValuePtr         : SQLPOINTER;
               BufferLength     : SQLINTEGER;
               StringLengthPtr  : access SQLINTEGER
            )  return SQLRETURN;

   function SQLGetDescRec
            (  DescriptorHandle : SQLHDESC;
               RecNumber        : SQLSMALLINT;
               Name             : char_array;
               BufferLength     : SQLSMALLINT;
               StringLengthPtr  : access SQLSMALLINT;
               TypePtr          : access SQL_DATA_TYPE;
               SubTypePtr       : access SQL_DATETIME_SUBCODE;
               LengthPtr        : access SQLLEN;
               PrecisionPtr     : access SQLSMALLINT;
               ScalePtr         : access SQLSMALLINT;
               NullablePtr      : access SQL_NULLABLE_FIELD
            )  return SQLRETURN;

   function SQLGetDescRecW
            (  DescriptorHandle : SQLHDESC;
               RecNumber        : SQLSMALLINT;
               Name             : SQLWCHAR_Array;
               BufferLength     : SQLSMALLINT;
               StringLengthPtr  : access SQLSMALLINT;
               TypePtr          : access SQL_DATA_TYPE;
               SubTypePtr       : access SQL_DATETIME_SUBCODE;
               LengthPtr        : access SQLLEN;
               PrecisionPtr     : access SQLSMALLINT;
               ScalePtr         : access SQLSMALLINT;
               NullablePtr      : access SQL_NULLABLE_FIELD
            )  return SQLRETURN;

   function SQLGetDiagField
            (  HandleType      : SQL_HANDLE;
               Handle          : SQLHANDLE;
               RecNumber       : SQLSMALLINT;
               DiagIdentifier  : SQL_DIAG;
               DiagInfoPtr     : access char;
               BufferLength    : SQLSMALLINT;
               StringLengthPtr : access SQLSMALLINT
            )  return SQLRETURN;

   function SQLGetDiagField
            (  HandleType      : SQL_HANDLE;
               Handle          : SQLHANDLE;
               RecNumber       : SQLSMALLINT;
               DiagIdentifier  : SQL_DIAG;
               DiagInfoPtr     : chars_ptr   := null_ptr;
               BufferLength    : SQLSMALLINT := 0;
               StringLengthPtr : access SQLSMALLINT
            )  return SQLRETURN;

   function SQLGetDiagFieldW
            (  HandleType      : SQL_HANDLE;
               Handle          : SQLHANDLE;
               RecNumber       : SQLSMALLINT;
               DiagIdentifier  : SQL_DIAG;
               DiagInfoPtr     : access SQLWCHAR;
               BufferLength    : SQLSMALLINT;
               StringLengthPtr : access SQLSMALLINT
            )  return SQLRETURN;

   function SQLGetDiagRec
            (  HandleType     : SQL_HANDLE;
               Handle         : SQLHANDLE;
               RecNumber      : SQLSMALLINT;
               State          : access SQLSTATE;
               NativeErrorPtr : access SQLINTEGER;
               MessageText    : chars_ptr   := null_ptr;
               BufferLength   : SQLSMALLINT := 0;
               TextLengthPtr  : access SQLSMALLINT
            )  return SQLRETURN;

   function SQLGetDiagRec
            (  HandleType     : SQL_HANDLE;
               Handle         : SQLHANDLE;
               RecNumber      : SQLSMALLINT;
               State          : access SQLSTATE;
               NativeErrorPtr : access SQLINTEGER;
               MessageText    : access char;
               BufferLength   : SQLSMALLINT;
               TextLengthPtr  : access SQLSMALLINT
            )  return SQLRETURN;

   function SQLGetDiagRecW
            (  HandleType     : SQL_HANDLE;
               Handle         : SQLHANDLE;
               RecNumber      : SQLSMALLINT;
               State          : access SQLWSTATE;
               NativeErrorPtr : access SQLINTEGER;
               MessageText    : access SQLWCHAR;
               BufferLength   : SQLSMALLINT;
               TextLengthPtr  : access SQLSMALLINT
            )  return SQLRETURN;

   function SQLGetDiagField
            (  HandleType      : SQL_HANDLE;
               Handle          : SQLHANDLE;
               RecNumber       : SQLSMALLINT;
               DiagIdentifier  : SQL_DIAG;
               DiagInfoPtr     : SQLPOINTER;
               BufferLength    : SQLSMALLINT;
               StringLengthPtr : access SQLSMALLINT
            )  return SQLRETURN;

   function SQLGetEnvAttr
            (  EnvironmentHandle : SQLHENV;
               Attribute         : SQL_ENV_ATTR;
               ValuePtr          : SQLPOINTER;
               BufferLength      : SQLINTEGER;
               StringLengthPtr   : access SQLINTEGER
            )  return SQLRETURN;

   function SQLGetFunctions
            (  ConnectionHandle : SQLHDBC;
               FunctionId       : SQL_API;
               SupportedPtr     : access SQLUSMALLINT
            )  return SQLRETURN;

   function SQLGetInfo
            (  ConnectionHandle : SQLHDBC;
               InfoType         : SQL_INFO;
               InfoValuePtr     : SQLPOINTER;
               BufferLength     : SQLSMALLINT;
               StringLengthPtr  : access SQLSMALLINT
            )  return SQLRETURN;

   function SQLGetInfo
            (  ConnectionHandle : SQLHDBC;
               InfoType         : SQL_INFO;
               InfoValuePtr     : access char;
               BufferLength     : SQLSMALLINT;
               StringLengthPtr  : access SQLSMALLINT
            )  return SQLRETURN;

   function SQLGetInfoW
            (  ConnectionHandle : SQLHDBC;
               InfoType         : SQL_INFO;
               InfoValuePtr     : access SQLWCHAR;
               BufferLength     : SQLSMALLINT;
               StringLengthPtr  : access SQLSMALLINT
            )  return SQLRETURN;

   function SQLGetInfo
            (  ConnectionHandle : SQLHDBC;
               InfoType         : SQL_INFO;
               InfoValuePtr     : chars_ptr   := null_ptr;
               BufferLength     : SQLSMALLINT := 0;
               StringLengthPtr  : access SQLSMALLINT
            )  return SQLRETURN;

   function SQLGetStmtAttr
             (  StatementHandle : SQLHSTMT;
                Attribute       : SQL_ATTR;
                ValuePtr        : SQLPOINTER;
                BufferLength    : SQLINTEGER;
                StringLengthPtr : access SQLINTEGER
             )  return SQLRETURN;

   function SQLGetTypeInfo
            (  StatementHandle : SQLHSTMT;
               DataType        : SQL_DATA_TYPE
            )  return SQLRETURN;

   function SQLMoreResults
            (  StatementHandle : SQLHSTMT
            )  return SQLRETURN;

   function SQLNativeSql
            (  ConnectionHandle : SQLHDBC;
               InStatementText  : char_array;
               TextLength1      : SQLINTEGER;
               OutStatementText : access char;
               BufferLength     : SQLINTEGER;
               TextLength2Ptr   : access SQLINTEGER
            )  return SQLRETURN;

   function SQLNativeSqlW
            (  ConnectionHandle : SQLHDBC;
               InStatementText  : SQLWCHAR_Array;
               TextLength1      : SQLINTEGER;
               OutStatementText : access SQLWCHAR;
               BufferLength     : SQLINTEGER;
               TextLength2Ptr   : access SQLINTEGER
            )  return SQLRETURN;

   function SQLNumParams
            (  StatementHandle   : SQLHSTMT;
               ParameterCountPtr : access SQLSMALLINT
            )  return SQLRETURN;

   function SQLNumResultCols
            (  StatementHandle : SQLHSTMT;
               ColumnCountPtr  : access SQLSMALLINT
            )  return SQLRETURN;

   function SQLParamData
            (  StatementHandle : SQLHSTMT;
               ValuePtrPtr     : access SQLPOINTER
            )  return SQLRETURN;

   function SQLPrepare
            (  StatementHandle : SQLHSTMT;
               StatementText   : char_array;
               TextLength      : SQLINTEGER
            )  return SQLRETURN;

   function SQLPrepareW
            (  StatementHandle : SQLHSTMT;
               StatementText   : SQLWCHAR_Array;
               TextLength      : SQLINTEGER
            )  return SQLRETURN;

   function SQLPrimaryKeys
            (  StatementHandle : SQLHSTMT;
               CatalogName     : char_Ptr    := null;
               NameLength1     : SQLSMALLINT := 0;
               SchemaName      : char_Ptr    := null;
               NameLength2     : SQLSMALLINT := 0;
               TableName       : char_Ptr    := null;
               NameLength3     : SQLSMALLINT := 0
            )  return SQLRETURN;

   function SQLPrimaryKeysW
            (  StatementHandle : SQLHSTMT;
               CatalogName     : SQLWCHAR_Ptr := null;
               NameLength1     : SQLSMALLINT  := 0;
               SchemaName      : SQLWCHAR_Ptr := null;
               NameLength2     : SQLSMALLINT  := 0;
               TableName       : SQLWCHAR_Ptr := null;
               NameLength3     : SQLSMALLINT  := 0
            )  return SQLRETURN;

   function SQLProcedureColumns
            (  StatementHandle : SQLHSTMT;
               CatalogName     : char_Ptr := null;
               NameLength1     : SQLSMALLINT := 0;
               SchemaName      : char_Ptr := null;
               NameLength2     : SQLSMALLINT := 0;
               ProcName        : char_Ptr := null;
               NameLength3     : SQLSMALLINT := 0;
               ColumnName      : char_Ptr := null;
               NameLength4     : SQLSMALLINT := 0
            )  return SQLRETURN;

   function SQLProcedureColumnsW
            (  StatementHandle : SQLHSTMT;
               CatalogName     : SQLWCHAR_Ptr := null;
               NameLength1     : SQLSMALLINT  := 0;
               SchemaName      : SQLWCHAR_Ptr := null;
               NameLength2     : SQLSMALLINT  := 0;
               ProcName        : SQLWCHAR_Ptr := null;
               NameLength3     : SQLSMALLINT  := 0;
               ColumnName      : SQLWCHAR_Ptr := null;
               NameLength4     : SQLSMALLINT  := 0
            )  return SQLRETURN;

   function SQLProcedures
            (  StatementHandle : SQLHSTMT;
               CatalogName     : char_Ptr := null;
               NameLength1     : SQLSMALLINT := 0;
               SchemaName      : char_Ptr := null;
               NameLength2     : SQLSMALLINT := 0;
               ProcName        : char_Ptr := null;
               NameLength3     : SQLSMALLINT := 0
            )  return SQLRETURN;

   function SQLProceduresW
            (  StatementHandle : SQLHSTMT;
               CatalogName     : SQLWCHAR_Ptr := null;
               NameLength1     : SQLSMALLINT  := 0;
               SchemaName      : SQLWCHAR_Ptr := null;
               NameLength2     : SQLSMALLINT  := 0;
               ProcName        : SQLWCHAR_Ptr := null;
               NameLength3     : SQLSMALLINT  := 0
            )  return SQLRETURN;

   function SQLPutData
            (  StatementHandle : SQLHSTMT;
               DataPtr         : SQLPOINTER;
               StrLen_or_Ind   : SQLLEN
            )  return SQLRETURN;

   function SQLRowCount
            (  StatementHandle : SQLHSTMT;
               RowCountPtr     : access SQLLEN
            )  return SQLRETURN;

   function SQLSetConnectAttr
            (  ConnectionHandle : SQLHDBC;
               Attribute        : SQL_ATTR;
               Value            : SQLUINTEGER;
               StringLength     : SQLINTEGER := SQL_IS_UINTEGER
            )  return SQLRETURN;

   function SQLSetConnectAttr
            (  ConnectionHandle : SQLHDBC;
               Attribute        : SQL_ATTR;
               Value            : SQLULEN;
               StringLength     : SQLINTEGER
            )  return SQLRETURN;

   function SQLSetConnectAttr
            (  ConnectionHandle : SQLHDBC;
               Attribute        : SQL_ATTR;
               ValuePtr         : char_array;
               StringLength     : SQLINTEGER
            )  return SQLRETURN;

   function SQLSetConnectAttrW
            (  ConnectionHandle : SQLHDBC;
               Attribute        : SQL_ATTR;
               ValuePtr         : SQLWCHAR_Array;
               StringLength     : SQLINTEGER
            )  return SQLRETURN;

   function SQLSetCursorName
            (  StatementHandle : SQLHSTMT;
               CursorName      : access SQLCHAR;
               NameLength      : SQLSMALLINT
            )  return SQLRETURN;

   function SQLSetDescField
            (  DescriptorHandle : SQLHDESC;
               RecNumber        : SQLSMALLINT;
               FieldIdentifier  : SQL_DESC;
               ValuePtr         : SQLPOINTER;
               BufferLength     : SQLINTEGER
            )  return SQLRETURN;

   function SQLSetDescRec
            (  DescriptorHandle : SQLHDESC;
               RecNumber        : SQLSMALLINT;
               SQLType          : SQL_DATA_TYPE;
               SQLSubType       : SQL_DATETIME_SUBCODE;
               Length           : SQLLEN;
               Precision        : SQLSMALLINT;
               Scale            : SQLSMALLINT;
               DataPtr          : SQLPOINTER;
               StringLengthPtr  : access SQLLEN;
               IndicatorPtr     : access SQLLEN
            )  return SQLRETURN;

   function SQLSetEnvAttr
            (  EnvironmentHandle : SQLHENV;
               Attribute         : SQL_ENV_ATTR;
               Value             : SQLINTEGER;
               StringLength      : SQLINTEGER := 0
            )  return SQLRETURN;

   function SQLSetEnvAttr
            (  EnvironmentHandle : SQLHENV;
               Attribute         : SQL_ENV_ATTR;
               Value             : SQLUINTEGER;
               StringLength      : SQLINTEGER := 0
            )  return SQLRETURN;

   function SQLSetEnvAttr
            (  EnvironmentHandle : SQLHENV;
               Attribute         : SQL_ENV_ATTR;
               ValuePtr          : char_array;
               StringLength      : SQLINTEGER
            )  return SQLRETURN;

   function SQLSetPos
            (  StatementHandle : SQLHSTMT;
               RowNumber       : SQLSETPOSIROW;
               Operation       : SQL_OPERATION;
               LockType        : SQL_LOCKTYPE
            )  return SQLRETURN;

   function SQLSetStmtAttr
            (  StatementHandle : SQLHSTMT;
               Attribute       : SQL_ATTR;
               ValuePtr        : SQLULEN;
               StringLength    : SQLINTEGER
            )  return SQLRETURN;

   function SQLSetStmtAttr
            (  StatementHandle : SQLHSTMT;
               Attribute       : SQL_ATTR;
               ValuePtr        : SQLPOINTER;
               StringLength    : SQLINTEGER
            )  return SQLRETURN;

   function SQLSpecialColumns
            (  StatementHandle : SQLHSTMT;
               IdentifierType  : SQL_IDENTIFIER;
               CatalogName     : char_Ptr    := null;
               NameLength1     : SQLSMALLINT := 0;
               SchemaName      : char_Ptr    := null;
               NameLength2     : SQLSMALLINT := 0;
               TableName       : char_Ptr    := null;
               NameLength3     : SQLSMALLINT := 0;
               Scope           : SQLSMALLINT;
               Nullable        : SQLSMALLINT
            )  return SQLRETURN;

   function SQLSpecialColumnsW
            (  StatementHandle : SQLHSTMT;
               IdentifierType  : SQL_IDENTIFIER;
               CatalogName     : SQLWCHAR_Ptr := null;
               NameLength1     : SQLSMALLINT  := 0;
               SchemaName      : SQLWCHAR_Ptr := null;
               NameLength2     : SQLSMALLINT  := 0;
               TableName       : SQLWCHAR_Ptr := null;
               NameLength3     : SQLSMALLINT  := 0;
               Scope           : SQLSMALLINT;
               Nullable        : SQLSMALLINT
            )  return SQLRETURN;

   function SQLStatistics
            (  StatementHandle : SQLHSTMT;
               CatalogName     : char_Ptr    := null;
               NameLength1     : SQLSMALLINT := 0;
               SchemaName      : char_Ptr    := null;
               NameLength2     : SQLSMALLINT := 0;
               TableName       : char_Ptr    := null;
               NameLength3     : SQLSMALLINT := 0;
               Unique          : SQLUSMALLINT;
               Reserved        : SQLUSMALLINT
            )  return SQLRETURN;

   function SQLStatisticsW
            (  StatementHandle : SQLHSTMT;
               CatalogName     : SQLWCHAR_Ptr := null;
               NameLength1     : SQLSMALLINT  := 0;
               SchemaName      : SQLWCHAR_Ptr := null;
               NameLength2     : SQLSMALLINT  := 0;
               TableName       : SQLWCHAR_Ptr := null;
               NameLength3     : SQLSMALLINT  := 0;
               Unique          : SQLUSMALLINT;
               Reserved        : SQLUSMALLINT
            )  return SQLRETURN;

   function SQLTables
            (  StatementHandle : SQLHSTMT;
               CatalogName     : char_Ptr    := null;
               NameLength1     : SQLSMALLINT := 0;
               SchemaName      : char_Ptr    := null;
               NameLength2     : SQLSMALLINT := 0;
               TableName       : char_Ptr    := null;
               NameLength3     : SQLSMALLINT := 0;
               TableType       : char_Ptr    := null;
               NameLength4     : SQLSMALLINT := 0
            )  return SQLRETURN;

   function SQLTablesW
            (  StatementHandle : SQLHSTMT;
               CatalogName     : SQLWCHAR_Ptr := null;
               NameLength1     : SQLSMALLINT  := 0;
               SchemaName      : SQLWCHAR_Ptr := null;
               NameLength2     : SQLSMALLINT  := 0;
               TableName       : SQLWCHAR_Ptr := null;
               NameLength3     : SQLSMALLINT  := 0;
               TableType       : SQLWCHAR_Ptr := null;
               NameLength4     : SQLSMALLINT  := 0
            )  return SQLRETURN;

   function SQLTablePrivileges
            (  StatementHandle : SQLHSTMT;
               CatalogName     : char_Ptr    := null;
               NameLength1     : SQLSMALLINT := 0;
               SchemaName      : char_Ptr    := null;
               NameLength2     : SQLSMALLINT := 0;
               TableName       : char_Ptr    := null;
               NameLength3     : SQLSMALLINT := 0
            )  return SQLRETURN;

   function SQLTablePrivilegesW
            (  StatementHandle : SQLHSTMT;
               CatalogName     : SQLWCHAR_Ptr := null;
               NameLength1     : SQLSMALLINT  := 0;
               SchemaName      : SQLWCHAR_Ptr := null;
               NameLength2     : SQLSMALLINT  := 0;
               TableName       : SQLWCHAR_Ptr := null;
               NameLength3     : SQLSMALLINT  := 0
            )  return SQLRETURN;
private
   pragma Import (StdCall, SQLAllocHandle,      "SQLAllocHandle");
   pragma Import (StdCall, SQLBindCol,          "SQLBindCol");
   pragma Import (StdCall, SQLBindParameter,    "SQLBindParameter");
   pragma Import (StdCall, SQLBrowseConnect,    "SQLBrowseConnectA");
   pragma Import (StdCall, SQLBrowseConnectW,   "SQLBrowseConnectW");
   pragma Import (StdCall, SQLBulkOperations,   "SQLBulkOperations");
   pragma Import (StdCall, SQLCancel,           "SQLCancel");
   pragma Import (StdCall, SQLCancelHandle,     "SQLCancelHandle");
   pragma Import (StdCall, SQLCloseCursor,      "SQLCloseCursor");
   pragma Import (StdCall, SQLColAttribute,     "SQLColAttributeA");
   pragma Import (StdCall, SQLColAttributeW,    "SQLColAttributeW");
   pragma Import (StdCall, SQLColumnPrivileges, "SQLColumnPrivilegesA");
   pragma Import (StdCall, SQLColumnPrivilegesW,"SQLColumnPrivilegesW");
   pragma Import (StdCall, SQLColumns,          "SQLColumnsA");
   pragma Import (StdCall, SQLColumnsW,         "SQLColumnsW");
   pragma Import (StdCall, SQLCompleteAsync,    "SQLCompleteAsync");
   pragma Import (StdCall, SQLConnect,          "SQLConnectA");
   pragma Import (StdCall, SQLConnectW,         "SQLConnectW");
   pragma Import (StdCall, SQLCopyDesc,         "SQLCopyDesc");
   pragma Import (StdCall, SQLDataSources,      "SQLDataSourcesA");
   pragma Import (StdCall, SQLDataSourcesW,     "SQLDataSourcesW");
   pragma Import (StdCall, SQLDescribeCol,      "SQLDescribeCol");
   pragma Import (StdCall, SQLDescribeParam,    "SQLDescribeParam");
   pragma Import (StdCall, SQLDisconnect,       "SQLDisconnect");
   pragma Import (StdCall, SQLDriverConnect,    "SQLDriverConnect");
   pragma Import (StdCall, SQLDrivers,          "SQLDrivers");
   pragma Import (StdCall, SQLEndTran,          "SQLEndTran");
   pragma Import (StdCall, SQLExecDirect,       "SQLExecDirectA");
   pragma Import (StdCall, SQLExecDirectW,      "SQLExecDirectW");
   pragma Import (StdCall, SQLExecute,          "SQLExecute");
   pragma Import (StdCall, SQLExtendedFetch,    "SQLExtendedFetch");
   pragma Import (StdCall, SQLFetch,            "SQLFetch");
   pragma Import (StdCall, SQLFetchScroll,      "SQLFetchScroll");
   pragma Import (StdCall, SQLForeignKeys,      "SQLForeignKeysA");
   pragma Import (StdCall, SQLForeignKeysW,     "SQLForeignKeysW");
   pragma Import (StdCall, SQLFreeHandle,       "SQLFreeHandle");
   pragma Import (StdCall, SQLFreeStmt,         "SQLFreeStmt");
   pragma Import (StdCall, SQLGetConnectAttr,   "SQLGetConnectAttrA");
   pragma Import (StdCall, SQLGetConnectAttrW,  "SQLGetConnectAttrW");
   pragma Import (StdCall, SQLGetCursorName,    "SQLGetCursorNameA");
   pragma Import (StdCall, SQLGetCursorNameW,   "SQLGetCursorNameW");
   pragma Import (StdCall, SQLGetData,          "SQLGetData");
   pragma Import (StdCall, SQLGetDescField,     "SQLGetDescField");
   pragma Import (StdCall, SQLGetDescRec,       "SQLGetDescRecA");
   pragma Import (StdCall, SQLGetDescRecW,      "SQLGetDescRecW");
   pragma Import (StdCall, SQLGetDiagField,     "SQLGetDiagFieldA");
   pragma Import (StdCall, SQLGetDiagFieldW,    "SQLGetDiagFieldW");
   pragma Import (StdCall, SQLGetDiagRec,       "SQLGetDiagRecA");
   pragma Import (StdCall, SQLGetDiagRecW,      "SQLGetDiagRecW");
   pragma Import (StdCall, SQLGetEnvAttr,       "SQLGetEnvAttr");
   pragma Import (StdCall, SQLGetFunctions,     "SQLGetFunctions");
   pragma Import (StdCall, SQLGetInfo,          "SQLGetInfoA");
   pragma Import (StdCall, SQLGetInfoW,         "SQLGetInfoW");
   pragma Import (StdCall, SQLGetStmtAttr,      "SQLGetStmtAttr");
   pragma Import (StdCall, SQLGetTypeInfo,      "SQLGetTypeInfo");
   pragma Import (StdCall, SQLMoreResults,      "SQLMoreResults");
   pragma Import (StdCall, SQLNativeSql,        "SQLNativeSqlA");
   pragma Import (StdCall, SQLNativeSqlW,       "SQLNativeSqlW");
   pragma Import (StdCall, SQLNumParams,        "SQLNumParams");
   pragma Import (StdCall, SQLNumResultCols,    "SQLNumResultCols");
   pragma Import (StdCall, SQLParamData,        "SQLParamData");
   pragma Import (StdCall, SQLPrepare,          "SQLPrepareA");
   pragma Import (StdCall, SQLPrepareW,         "SQLPrepareW");
   pragma Import (StdCall, SQLPrimaryKeys,      "SQLPrimaryKeysA");
   pragma Import (StdCall, SQLPrimaryKeysW,     "SQLPrimaryKeysW");
   pragma Import (StdCall, SQLProcedureColumns, "SQLProcedureColumnsA");
   pragma Import (StdCall, SQLProcedureColumnsW,"SQLProcedureColumnsW");
   pragma Import (StdCall, SQLProcedures,       "SQLProceduresA");
   pragma Import (StdCall, SQLProceduresW,      "SQLProceduresW");
   pragma Import (StdCall, SQLPutData,          "SQLPutData");
   pragma Import (StdCall, SQLRowCount,         "SQLRowCount");
   pragma Import (StdCall, SQLSetConnectAttr,   "SQLSetConnectAttrA");
   pragma Import (StdCall, SQLSetConnectAttrW,  "SQLSetConnectAttrW");
   pragma Import (StdCall, SQLSetCursorName,    "SQLSetCursorName");
   pragma Import (StdCall, SQLSetDescField,     "SQLSetDescField");
   pragma Import (StdCall, SQLSetDescRec,       "SQLSetDescRec");
   pragma Import (StdCall, SQLSetEnvAttr,       "SQLSetEnvAttr");
   pragma Import (StdCall, SQLSetPos,           "SQLSetPos");
   pragma Import (StdCall, SQLSetStmtAttr,      "SQLSetStmtAttr");
   pragma Import (StdCall, SQLSpecialColumns,   "SQLSpecialColumnsA");
   pragma Import (StdCall, SQLSpecialColumnsW,  "SQLSpecialColumnsW");
   pragma Import (StdCall, SQLStatistics,       "SQLStatisticsA");
   pragma Import (StdCall, SQLStatisticsW,      "SQLStatisticsW");
   pragma Import (Stdcall, SQLTables,           "SQLTablesA");
   pragma Import (Stdcall, SQLTablesW,          "SQLTablesW");
   pragma Import (Stdcall, SQLTablePrivileges,  "SQLTablePrivilegesA");
   pragma Import (Stdcall, SQLTablePrivilegesW, "SQLTablePrivilegesW");

end ODBC.Driver_Dependent;
