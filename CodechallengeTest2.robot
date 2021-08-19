*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    JSONLibrary    
Library    String    

*** Variables ***
${base_url}   https://clarity.dexcom.com
${base_url_uam}    https://uam1.dexcom.com
${signurl}    /identity/login?signin=24feba0108db83ae3bdd433074972d51
${cookie}    idsrv.xsrf=8QyhmH3kfP6KLJz2C9YJAHp1Ae8-KMeQ84-MHcz6mv2V8tWfiYo6DwnO02U2gBAUIYcMCDtZaWvAzBU-mtA3zphTxoc5Yi5-b7resW1Ggps; idsvr.clients=WyJEQUVDMjBBQy05NjI2LTRCMEUtOTRCNS1CNjc0RTI5OEY1MUUiLCIwYjcyYzU4MS0yZTk4LTQ2NDQtOTg5Yy01MmM3NmUzNDg0MmIiLCIxYmU0OTRhZC00MzEyLWE4ZjctYjAxYi0wYzNjZjZiOTNhOTYiXQ; SignInMessage.5b4b4de10a6b23297487f7185d03f28c=umnRSZnGNi6pjDgS2hrIdJ7tZSFUks7cZVRIaKWo8MnpStnhaJvHMA8XPwL0pkavs-wYMJCNpImMPdhPuKyrqCWvx2Jwh7PfnkWMFQbtV5W7QxZBzhxFNjja5V5kxpvjTBSDfXBFhoi5GqPXL5EkGnA-cVu5jErjmEUYhIrwKpcbTGVJ-t0I9lKzqphQB_9k04bVdGE7zbL4qt_5nJdJgY5jJFIQ1BTpiifgliiG7waxG-uuAzJn9rNAi4IwTxOEb8jjlj1SNj09fjWSfsltM0B52YEZbunicJi1ezahH2F955sTRb8jfV9bidsnzjaScFdtqwleue2FeS5J8izgytt6O2Un0F_N5dtzV5yWiv3aGtZrRDH2dewL2AQ9pCW1d5i0OlBnTSiHJvwR7zV-t_L3oRrgTfOLpZ7-nFDn5aWzYycy9KQ2bdzIuEVZIw4z5en9W4FnvtZwTXSdvfspRBqTCSm1MwmsiVfHH2uZ-DGFblilyP1aGdbjjjP6GtJKe4C7B0jPm_fPXvBugUShOVO8AWa1IHfvhd86UmEAS8qLJ0e5yU5mKsLBnMGPZZ3JKGB83ZJL_6Z9La5suXPwlv1LfXKol2kByHkUc9dewbS61xpfg9U_c7SYJcr5JKk5wbGDWwj6Bono4m9xwZYxwA; SignInMessage.d4857a13512d3905f4f0f93ea1d06720=4drUnUl-er-NtcnyyN4_UwmDidxYaI7WyS75WV5cs6oh3xLxKg1zicZZ4j_nGl75RLtB4F-Q6xZG_HW_iwZF24GvtQAWBMNsoxcVpk6FPpfq8j1V-WjPTdbJ65_14HkUxpVkpqUvOUkdN-CcVQYafphbWA7UIRqa4ArwKdInMDRkLTGMMuMqIAZODCU0709arNYaPn1_5D6Eu2tp9DPhp7rEJFfqUDFcvNy94WSMkEXvA-CC40oc1JTQJ8uy6rO8O2ritVya-gGyZ36vJmA_QL-P_JzA6LMIFL7pFLkudYmotrMpYzRAuzmFFsS5aTsoR0df9RjVbbFjfahJPiVEL7RyRKUN5t8DxNfPPbNCFQ39tTMR-h4WYrkVVxbnub9utWJ2BiGyqjSvubXa5tPCmwAi9ZbweQW_tkv8DGLEkk2vDJQ8zg1qhMjx7nzyyDQTJAcjUfwVcPvC_4lhOf9daa8qRTD52y_kYvzG3d8z01NqTlBKxsIE1Co8n5WL-OWs_o_zHS2jK93KRqaXiFE_IgQvfb76HcCV50juNzIraBWTppfJG1xfSWFyi8apYx-AhXnnIOvuuMwStR3eJ5P66SeK4fbovw2W-cDRTBD9r-YpwP6x_fmPbAUpO4hfbIvbIbOKuJIfpaViR97gpkd1aw; SignInMessage.a88294b9321767dace82a0997f81ddfc=pqu5HLvvTfkAdbMKR86AXD2J4ESpUeVRVVNi38RsvmP-r3biUmhdc5hCdoudSfz-ueFSFc0SyCjPkNnRUHr2y2dgOVZ1rmnnFMCIWMASOwtFUW_GbOR5V-fd_A3COO5qpWQaAmWA_ubWXd14UWQVEkbQJG-yvJlXQQvO7Uh-8xOp_Vq8kMcZfLFc6uWwIY2qceqiE-2jl-JnIdgWVH6CP1ud2QITB7SIDu_OzGdePtcxD1xdMT9saX9S7Bdj0rk0XbI12X3Q_xFlaKkpnQDhhoMQeGOJnIomhOZ8Ma-JQ6AZSnS1gBeuBh-nukF0_Q5RaUlYN5Bd8gKVZk-tJIDjsm0zLFoE1IOkmDwd8BNBRGYmm6cSF-sVMqzvYNn11hRI72kbXRlojZpQcwAUcVMi5608LSmG9nAIeztv0ltcTMqZp0H69yP-ZkNTmALir6wbtfGqOUsC7qknMI6CDR7Yy-a6ZT2BASlUFQAtyM-kEmpXo1WZJy8_3LGcjjR3c6Z-xdoND8kxZLRJNZAgxBt-MsVvjDLqSydkQ9YMQPQBogPl82o8zX1wlb9MUSHIwqgzcX5YmZqOWq8CDTMekPU2jqhaxqw2UPbLjVLKtvNZLkZX5p5eNpgKWG1sAm8UgVikDz83dCMb89BmF3_7NLPmzQ; SignInMessage.10210285e6df897d3ce8d946d1449f15=JORolkBBZw4ITrm-qLcs-PMkKJzjD9qsdL65TyoSOB1z2riDfRDkHVsTHmDmDdxG6Oayv_Qfpl0-HeL2bUQokfnNUfrtndBbaZ3HFdfdtlmcPHL5bk3VkjpTmmcjYC3t8BgERApPbFjtpoetzwvLTLB5MMJ37Z8kvtP-_KDf9rhhjq5PAsxyQHv0LOynWuLCM9koREdkRgkKxluZnhPkdtZurbGIb3hGenDv1N46T2SuYgyYckLbV2TvgOAQ-1C0xRvXUvizXTte6znIrefCthrvZjN9MAKw1GWfrnkmgiiqPVsbhiFTOK5rzf8rumeekBtKotXw62tE5mkBhCrB-x1qh7nIOKVadlTvRUhQxQtVOZHS_1g3YVp-CcWqfF_n5y1Ln32ytN2mlqJu-1re9e-n7eCOzZgVAuYYBNSk5hN7IMl3pBP1DoTIdG4JtLWja5fynnM5VXA7Zdfi6XdUc1r5EOsT7He80C14loERn59yxGnknMzpCWonNF1M9CvDsGWGjgs5KqkSkn2Q2m8hN6glYxcCJ7GsjMOxafOQrVfiZJ4QFpc2hAmptg--b0FPDfy4L7O2spJomw7iNw-4g_h9M2DjlJKumHxgrRAipBmz6-_ONokxlaQwTzh6jMCQJq2aJnsmlb9eY-eJBfIRQQ; idsvr.session=6ada38f53b7c8ececc765e804d4be988; SignInMessage.24feba0108db83ae3bdd433074972d51=0nhB5rSwnjZG4F1CpQVWp7hHDOGaplohB4vzdVqKW0uc2-Td-fuPBFl2BRBeY2ntNN_8QqLPzUnrH_McgUtrghsd3-p0ygjXgqKOS0agxulaEq6lOZB554UKwl7uGSJtQKMVyDk0eCGaxJEZCSENMdTwI-ox8S004QWaXnVoTvnxvhF_JBsrsn0gfy3dh4iI_-ynjKI6eOAG_-_AvGfqMYmA7nLPwdA5iWsXPUS4BK2jr4tGE1CltpKR_j-ap4950DxuWGFRoHkTPa7F-d6aDjzzd4vg86emRZ5Dli6adoUSO_Y_6ElP9uRxSqdXdeUbdw4VCSgThTyFs5S_0HPwi0zAhw8VfvDPTinjec6cwnfP8qQSvWyQgrYj9YQ7QN4LQviqOnhr9aYkSKS6vg3D-3ZTjAuXAmNVKtoAwFpjGovWNxyMku81v2W2Db5ScRRV0M8tmVrUjJQWpeRR8OQZrUmcsCdC1jPOtYYOjwqU3nD_Jwo2ozWAYr41ITyPjWKWf9sLx7Xn4gJo_cejFp7RLZfa4wsInNvukI6cLbPK3zd2NDSpVqTuxejsltjg4TxUN9hAtVtt-lZh8GXVbrKYOgzlGIP1X3daXG7ChlrPzF2MLrrT404KsoGwXPLZl-ua493wZd6va4vGvc0HcvCWdQ; has_js=1 
${cookie_callback}    idsrv=giug7_F7ZlcUTkHS1tGdtMp48dzG_58dotAaPPykv0cIFqtkq1FBNCTOHQzgGuv5FJAUb4aDyjpiWlG6Wter2a6hGHnSgnAT8YPvXXRgvl5EuLWYwfes_gXMBEtDsTGHJ2uQCAPR4bETB38L1v1P2Av0QuPzBC50kBqT1Ykx53vIz9owkJRkbq1bkByY5MKl5Hs3T8hkdcpA1jxZirPfwFnaF6xhOKvmxoj165d4Ov3fwY3k6vcfFqfGM8DaXjrVsnOprJAb9EES9CXPRoYdXwopVi-NzVzk7i7QEFb6iVHiZndhycikNL37DKoTljUsjT_SiB2419TA4dzQYyj2oKmAuo2PQRyLmNiz5MMCHaWaWEKA9yKtM6SC7bBL9OecvKn_DHvW5jGAcdL3oH57QQ; Path=/identity; Secure; HttpOnly;
${cookie_final}    _rogue_material_session=7d6a9221633a05c1c626cce1debe1572 
${bearerToken}   eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJodHRwczovL3N3ZWV0c3BvdGRpYWJldGVzLmNvbSIsInN1YiI6IlN3ZWV0c3BvdCIsImlhdCI6MTYyOTE0NjEyOCwiY29uc2VudFBlcm1pc3Npb24iOiJsaW5rZWRTdWJqZWN0cyIsImRleGNvbUlkIjoiMjgzOWNkZmQtZWI1NC00MWU4LWI5YmYtYTA4OGUwODhmMzI1IiwiZXhwIjoxNjI5MjMyNTI4LCJyb2xlIjoiT3duZXIiLCJzdWJqZWN0SWQiOiIxNjgxMjc3Nzk0NTc1NzY1NTA0In0.u8oo9UeRQ9YjM9M-GAj__yCFqkNJ3wodBi-vAof1t-iJYL6FYxc40a4eeLXxmPTXLcfCq2QIcdhn-yLGF7YXRP-pskYa-AShHX0RT3jR9TtvmIKSvXoCKjARdWZRaJoX3W4_XGLFSDbpek-UDSl3UBrlb-RtU41viLLcdu__EJd6bFtDHe45xYMo6z0qy_rWqmKIYQkghLuyPKo_JqWVnLEkeX7VWFEyLRJM-X6vQ68kO1izWLPiUT1gQRYp7gl1Wjdisr2LXJLNG1jD76P1wTi0_NGfi_xq9U7nz0lMatxyhavm-PlA-qZPMZRB67QA6uVXVafOPz0bcgf7YBXzJw
*** Test Cases ***
Get Request Test
      Create Session    mysession  ${base_url}    verify=True
      ${resp}=   GET On Session  mysession  /  expected_status=200
      Log To Console    ${resp} 
      ${hearders}    Create Dictionary    Access-Token=${bearerToken}    Content-Type=application/json    charset=utf-8
      ${resp_post}=    Post On Session    mysession    /api/subject/1681277794575765504/analysis_session    headers=${hearders} 
      Log To Console    ${resp_post.json().get("analysisSessionId")}   
Check the POST Analysis Request Test
      # first in the uam page to create a POST request to login, turnoff the autoredirect
      Create Session    login    ${base_url_uam}    verify=true
      ${headers_signin}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded    cookie=${cookie}    
      ${data}=    Create Dictionary    username=codechallenge    password=Password123    idsrv.xsrf=A8L5Y8l7d-gJxtMAB_b5fYWjgE-TUkr9oswoPp3p1SNxl7mpR34-bU0zjOItnOIyoWTbImBBbxS6Swx-tJHRhdxavVaBYeLUIaB2lB9Jc2M
      ${resp_login}=    Post On Session    login    ${signurl}    data=${data}    headers=${headers_signin}     allow_redirects=${False}
      # from the response get the redirect url for authorization code 
      ${redirect_url}=    Set Variable    ${resp_login.headers.get("location")}
      # send the redirect url for GET requestto get the call back code for access token, turn off the autoredirect
      ${headers_callback}=    Create Dictionary    cookie=${cookie_callback}            
      ${resp_callback}=    GET    ${redirect_url}    headers=${headers_callback}   allow_redirects=${False}
      ${callback_url}=    Set Variable    ${resp_callback.headers.get("location")} 
    
      ${headers_final}=    Create Dictionary    Cookie=${cookie_final}   
      ${resp_final}=    GET    ${callback_url}  headers=${headers_final}    allow_redirects=${False}
      
      #in the network console, there is clarity.dexcom.com followed by this get request, so send this webiste GET request
      ${resp_token}=    GET    https://clarity.dexcom.com/    headers=${headers_final}
      ${raw_response}=    Set Variable    ${resp_token.text}
      #as the response is HTML so we need use Regexp way to filter the access token out
      ${lines}=    Get Lines Matching Regexp    ${raw_response}   window\.ACCESS    partial_match=true
      ${result}=   Get Regexp Matches    ${lines}    ".+"
      ${result_str}=    Convert To String   ${result}
      #when it returned as string, it has format ['"xxxxxxxxxx"'], consider to use substring way to remove the special characters
      ${length}=    Get Length    ${result_str}
      ${end}=    Evaluate    ${length}-${3}     
      ${result_str_new}=    Get Substring    ${result_str}    3      ${end}             
      
      # create a new call session for accessing the api/suject/16812... then verify if the token is passed correctly
      Create Session    mysession  ${base_url}    verify=True
      ${resp}=   GET On Session  mysession  /  expected_status=200
      ${hearders}    Create Dictionary    Access-Token=${result_str_new}  Content-Type=application/json    charset=utf-8
      ${resp_post}=    Post On Session    mysession    /api/subject/1681277794575765504/analysis_session    headers=${hearders} 
      Log To Console    ${resp_post.json().get("analysisSessionId")} 
      Should Not Be Empty    ${resp_post.json().get("analysisSessionId")}            
                
    
     
 