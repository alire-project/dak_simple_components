--                                                                    --
--  procedure Test_HTTPS_Client     Copyright (c)  Dmitry A. Kazakov  --
--  HTTPS client test                              Luebeck            --
--                                                 String, 2015       --
--                                                                    --
--                                Last revision :  23:22 29 Sep 2017  --
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

with Ada.Exceptions;               use Ada.Exceptions;
with Ada.Text_IO;                  use Ada.Text_IO;
with Ada.Streams;                  use Ada.Streams;
with GNAT.Sockets.Server.Handles;  use GNAT.Sockets.Server.Handles;
with GNUTLS;                       use GNUTLS;
--with GNAT.Exception_Traces;      use GNAT.Exception_Traces;
with Strings_Edit.Integers;        use Strings_Edit.Integers;
with Strings_Edit.Streams;         use Strings_Edit.Streams;
with Test_HTTP_Servers.Secure;     use Test_HTTP_Servers.Secure;

with GNAT.Sockets.Connection_State_Machine.HTTP_Client.Signaled;
with GNAT.Sockets.Server.Pooled;
with GNAT.Sockets.Server.Secure.Anonymous;
with GNAT.Sockets.Server.Secure.X509;

procedure Test_HTTPS_Client is
   use GNAT.Sockets.Connection_State_Machine.HTTP_Client.Signaled;

   Tasks : constant := 5;
begin
-- Trace_On (Every_Raise);
   GNUTLS.Set_TLS_Debug (5);
   declare
--        Factory : aliased Anonymous_HTTPS_Factory
--                          (  Request_Length  => 200,
--                             Input_Size      => 40,
--                             Output_Size     => 1024,
--                             Decoded_Size    => 40,
--                             Max_Connections => 100
--                          );
      Factory : aliased X509_HTTPS_Factory
                        (  Request_Length  => 200,
                           Input_Size      => 40,
                           Output_Size     => 1024,
                           Decoded_Size    => 40,
                           Max_Connections => 100
                        );
   begin
      Add_System_Trust (Factory);
      Add_Key_From_PEM_File
      (  Factory          => Factory,
         Certificate_File => "test.cert.pem",
         Key_File         => "test.key.pem"
      );
      Add_Key_From_PEM_File
      (  Factory          => Factory,
         Certificate_File => "test.cert.pem",
         Key_File         => "test.key.pem"
      );
      Generate_Diffie_Hellman_Parameters (Factory);
      Trace_On
      (  Factory  => Factory,
         Received => GNAT.Sockets.Server.Trace_Any,
         Sent     => GNAT.Sockets.Server.Trace_Any
      );
      Set_TLS_Tracing
      (  Factory => Factory,
         Session => True,
         Decoded => True
      );
      declare
--           Server  : aliased GNAT.Sockets.Server.Pooled.Pooled_Server
--                     (  Factory'Access,
--                        Port,
--                        Tasks
--                     );
         Message   : aliased String_Stream (1024 * 100);
         Server    : aliased GNAT.Sockets.Server.
                             Connections_Server (Factory'Access, 0);
         Reference : GNAT.Sockets.Server.Handles.Handle;
      begin
         Put_Line ("HTTP server started");
         Set
         (  Reference,
            new HTTP_Session_Signaled
                (  Server'Unchecked_Access,
                   200,
                   512,
                   1024
         )      );
         declare
            Client : HTTP_Session_Signaled renames
                     HTTP_Session_Signaled (Ptr (Reference).all);
         begin
            Connect (Client, "httpbin.org", 443);
            Get
            (  Client,
               "https://httpbin.org/get",
               Message'Unchecked_Access
            );
            Wait (Client, False);
            Put_Line
            (  Image (Get_Response_Code (Client))
            &  " "
            &  Get_Response_Reason (Client)
            &  " Message >>>>>>>>>>>>>>>>>>>>"
            );
            Put_Line (Get (Message));
            Put_Line ("<<<<<<<<<<<<<<<<<<<< Message");
         end;
         Put_Line ("HTTP server stopping");
      end;
   end;
exception
   when Error : others =>
      Put_Line ("Error: " & Exception_Information (Error));
end Test_HTTPS_Client;
