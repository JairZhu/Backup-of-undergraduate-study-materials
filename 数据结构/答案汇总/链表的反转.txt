#include<iostream>
#include"ListNode.h" 
using namespace std;

ListNode* reverseList(ListNode* head){
 ListNode* pre = NULL;
    while (head) {
        ListNode* next = head -> next;
        head -> next = pre;
        pre = head;
        head = next;
    } 
    return pre;
}