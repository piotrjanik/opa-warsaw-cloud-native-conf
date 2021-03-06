package demo

test_any_user_should_get_all_enquiries {
    allow with input as {
        "principal": "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJCRnB1MTloczhpbk5jY2VqeUNrMTlPekQzZ2xTbEpGN0hNOGNDdWt4MmFRIn0.eyJqdGkiOiI4MmExNDcwNS05ZmU0LTQ2ZjQtOTYzZS05M2RhYWNjYTAwMjkiLCJleHAiOjE1Njc4NjAzMjAsIm5iZiI6MCwiaWF0IjoxNTY3ODU5NDIwLCJpc3MiOiJodHRwczovL29wYS5kby5waW90cmphbmlrLmRldi9hdXRoL3JlYWxtcy9teV9yZWFsbSIsImF1ZCI6ImFjY291bnQiLCJzdWIiOiI4NTk5ZjE5OC0yOGJmLTQ2ZWUtYWQ0Yi1kOGUxMTgzNDdhZWIiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJvcGEtZGVtbyIsIm5vbmNlIjoieGpSeVhTMndtQU9lWXpObXFhSHBnN1BBR1gzYTdhdUgtREozOWFOR0xMY0l1IiwiYXV0aF90aW1lIjoxNTY3ODU5NDIwLCJzZXNzaW9uX3N0YXRlIjoiMmY0MzM4NjgtZWRiMS00NjBlLWEzZGEtMjA4MmVlNWU1ODcyIiwiYWNyIjoiMSIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIl19LCJyZXNvdXJjZV9hY2Nlc3MiOnsiYWNjb3VudCI6eyJyb2xlcyI6WyJtYW5hZ2UtYWNjb3VudCIsIm1hbmFnZS1hY2NvdW50LWxpbmtzIiwidmlldy1wcm9maWxlIl19fSwic2NvcGUiOiJvcGVuaWQgZW1haWwgcHJvZmlsZSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwibmFtZSI6IkFkYW0iLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJhZGFtIiwiZ2l2ZW5fbmFtZSI6IkFkYW0iLCJlbWFpbCI6ImFkYW1AZXhhbXBsZS5jb20ifQ.JUsnDES9GSF8sdvyIzcKRFknhqooGK-OWJIhLstk75dF-6L0HyFZNpp5_tI3K8VLC6AoLsS4baAaWoLNBe8lCpxyZMQZ4_uLU9eKzCdde-uf5eZzzJj6LS-t6P92z0PrLPuTH4L6ZkfRfQ3qZmGTQlzzy8f_XspHY_ASho_kOuiWq0CGJsL-5c_9YyjLHkHXohenY-_tiwBpDFzYJaJop04HKbKKlFuzOGZcPpVYgVNQL3TrH0eayQPdnTeNB4KzCZrCjbLqpe8iCo4vpR4AKptT_V-C9uNejQV9dBnyQp3PufYbk6dBOC0W7DSDMsS2PDLmrsITzETxJ74Wh9TPuQ",
        "action": "GetAll",
        "resource": {"name":"enquiries"}
    }
}

test_not_verified_user_cannot_update {
    not allow with input as {
        "principal": "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJCRnB1MTloczhpbk5jY2VqeUNrMTlPekQzZ2xTbEpGN0hNOGNDdWt4MmFRIn0.eyJqdGkiOiI4MmExNDcwNS05ZmU0LTQ2ZjQtOTYzZS05M2RhYWNjYTAwMjkiLCJleHAiOjE1Njc4NjAzMjAsIm5iZiI6MCwiaWF0IjoxNTY3ODU5NDIwLCJpc3MiOiJodHRwczovL29wYS5kby5waW90cmphbmlrLmRldi9hdXRoL3JlYWxtcy9teV9yZWFsbSIsImF1ZCI6ImFjY291bnQiLCJzdWIiOiI4NTk5ZjE5OC0yOGJmLTQ2ZWUtYWQ0Yi1kOGUxMTgzNDdhZWIiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJvcGEtZGVtbyIsIm5vbmNlIjoieGpSeVhTMndtQU9lWXpObXFhSHBnN1BBR1gzYTdhdUgtREozOWFOR0xMY0l1IiwiYXV0aF90aW1lIjoxNTY3ODU5NDIwLCJzZXNzaW9uX3N0YXRlIjoiMmY0MzM4NjgtZWRiMS00NjBlLWEzZGEtMjA4MmVlNWU1ODcyIiwiYWNyIjoiMSIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIl19LCJyZXNvdXJjZV9hY2Nlc3MiOnsiYWNjb3VudCI6eyJyb2xlcyI6WyJtYW5hZ2UtYWNjb3VudCIsIm1hbmFnZS1hY2NvdW50LWxpbmtzIiwidmlldy1wcm9maWxlIl19fSwic2NvcGUiOiJvcGVuaWQgZW1haWwgcHJvZmlsZSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwibmFtZSI6IkFkYW0iLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJhZGFtIiwiZ2l2ZW5fbmFtZSI6IkFkYW0iLCJlbWFpbCI6ImFkYW1AZXhhbXBsZS5jb20ifQ.JUsnDES9GSF8sdvyIzcKRFknhqooGK-OWJIhLstk75dF-6L0HyFZNpp5_tI3K8VLC6AoLsS4baAaWoLNBe8lCpxyZMQZ4_uLU9eKzCdde-uf5eZzzJj6LS-t6P92z0PrLPuTH4L6ZkfRfQ3qZmGTQlzzy8f_XspHY_ASho_kOuiWq0CGJsL-5c_9YyjLHkHXohenY-_tiwBpDFzYJaJop04HKbKKlFuzOGZcPpVYgVNQL3TrH0eayQPdnTeNB4KzCZrCjbLqpe8iCo4vpR4AKptT_V-C9uNejQV9dBnyQp3PufYbk6dBOC0W7DSDMsS2PDLmrsITzETxJ74Wh9TPuQ",
        "action": "Update",
        "resource": {"name":"enquiries"}
    }
}

test_verified_john_user_can_update_1st {
    allow with input as {
        "principal": "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJCRnB1MTloczhpbk5jY2VqeUNrMTlPekQzZ2xTbEpGN0hNOGNDdWt4MmFRIn0.eyJqdGkiOiIyZTEwYjgzNy0yODQ5LTRhOTAtOGI5OS1jYWI4OTkwMTkxMTAiLCJleHAiOjE1Njc4NzEzNjEsIm5iZiI6MCwiaWF0IjoxNTY3ODcwNDYxLCJpc3MiOiJodHRwczovL29wYS5kby5waW90cmphbmlrLmRldi9hdXRoL3JlYWxtcy9teV9yZWFsbSIsImF1ZCI6ImFjY291bnQiLCJzdWIiOiJjNDgzM2Y0Mi1hNDkzLTQ5N2EtOWI1ZS1hOTljMWEyYjJlYWEiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJvcGEtZGVtbyIsIm5vbmNlIjoiSV9DckRZWTVjLXdoSlM4UlJYMWY5QjhCWFlQemo3WXhLMndxVWdPbkxXcml2IiwiYXV0aF90aW1lIjoxNTY3ODcwMDU1LCJzZXNzaW9uX3N0YXRlIjoiNjMyMzQ3MTItMDkwZi00NmY1LWEzZTYtZTViZjQzOWZjN2EyIiwiYWNyIjoiMCIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIl19LCJyZXNvdXJjZV9hY2Nlc3MiOnsiYWNjb3VudCI6eyJyb2xlcyI6WyJtYW5hZ2UtYWNjb3VudCIsIm1hbmFnZS1hY2NvdW50LWxpbmtzIiwidmlldy1wcm9maWxlIl19fSwic2NvcGUiOiJvcGVuaWQgZW1haWwgcHJvZmlsZSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJuYW1lIjoiSm9obiIsInByZWZlcnJlZF91c2VybmFtZSI6ImpvaG4iLCJnaXZlbl9uYW1lIjoiSm9obiIsImVtYWlsIjoiam9obkBleGFtcGxlLmNvbSJ9.CS9Rt61XNJ1sOOFJzGSh0OUs4Q771LROkwgmmn6Fs7qXkUlrjVaAXcVHIWXNpQGX0d7JGpui2JDpvoh4YJ6bQKeFcyBs2HOvgk_nmnykTuOa5n1rPutpQ_AV-iNPWVSTNRkIdOywPF9_HYUfk5wN4GvGbXVUOa4eLWFaQ_deMsOF-0x894EB6uTt8sSV9000XDVTXxqsDvs2EITFYkTrOj2PIRo1n1DUYneBqM8ZFb26P_JN2udMc0O8jvr3kcLoKbZr-SMIHdkLTUEA1Rrpbkpn7DvDgQA2YtICUQKikQH8zJT4Ahml4-DqdGtXJk1L-50uJfgBvxnAy16dENj9BQ",
        "action": "Update",
        "resource": {"name":"enquiries", "id": 1}
    }
}

test_verified_john_user_cannot_update_6th {
    not allow with input as {
        "principal": "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJCRnB1MTloczhpbk5jY2VqeUNrMTlPekQzZ2xTbEpGN0hNOGNDdWt4MmFRIn0.eyJqdGkiOiIyZTEwYjgzNy0yODQ5LTRhOTAtOGI5OS1jYWI4OTkwMTkxMTAiLCJleHAiOjE1Njc4NzEzNjEsIm5iZiI6MCwiaWF0IjoxNTY3ODcwNDYxLCJpc3MiOiJodHRwczovL29wYS5kby5waW90cmphbmlrLmRldi9hdXRoL3JlYWxtcy9teV9yZWFsbSIsImF1ZCI6ImFjY291bnQiLCJzdWIiOiJjNDgzM2Y0Mi1hNDkzLTQ5N2EtOWI1ZS1hOTljMWEyYjJlYWEiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJvcGEtZGVtbyIsIm5vbmNlIjoiSV9DckRZWTVjLXdoSlM4UlJYMWY5QjhCWFlQemo3WXhLMndxVWdPbkxXcml2IiwiYXV0aF90aW1lIjoxNTY3ODcwMDU1LCJzZXNzaW9uX3N0YXRlIjoiNjMyMzQ3MTItMDkwZi00NmY1LWEzZTYtZTViZjQzOWZjN2EyIiwiYWNyIjoiMCIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIl19LCJyZXNvdXJjZV9hY2Nlc3MiOnsiYWNjb3VudCI6eyJyb2xlcyI6WyJtYW5hZ2UtYWNjb3VudCIsIm1hbmFnZS1hY2NvdW50LWxpbmtzIiwidmlldy1wcm9maWxlIl19fSwic2NvcGUiOiJvcGVuaWQgZW1haWwgcHJvZmlsZSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJuYW1lIjoiSm9obiIsInByZWZlcnJlZF91c2VybmFtZSI6ImpvaG4iLCJnaXZlbl9uYW1lIjoiSm9obiIsImVtYWlsIjoiam9obkBleGFtcGxlLmNvbSJ9.CS9Rt61XNJ1sOOFJzGSh0OUs4Q771LROkwgmmn6Fs7qXkUlrjVaAXcVHIWXNpQGX0d7JGpui2JDpvoh4YJ6bQKeFcyBs2HOvgk_nmnykTuOa5n1rPutpQ_AV-iNPWVSTNRkIdOywPF9_HYUfk5wN4GvGbXVUOa4eLWFaQ_deMsOF-0x894EB6uTt8sSV9000XDVTXxqsDvs2EITFYkTrOj2PIRo1n1DUYneBqM8ZFb26P_JN2udMc0O8jvr3kcLoKbZr-SMIHdkLTUEA1Rrpbkpn7DvDgQA2YtICUQKikQH8zJT4Ahml4-DqdGtXJk1L-50uJfgBvxnAy16dENj9BQ",
        "action": "Update",
        "resource": {"name":"enquiries","id": 6}
    }
}