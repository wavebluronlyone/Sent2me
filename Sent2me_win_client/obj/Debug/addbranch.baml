   M S B A M L   `   `   `  ����M  ISent2me_win_client, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:Sent2me_win_clientSent2me_win_client  5   	   "    Sent2me_win_client.addbranch   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   2local clr-namespace:Sent2me_win_client     5   	   -   5          � Title$*  $การเพิ่มสาขา��5   	   $	��300��6   $	��300��6+    � WindowStyle$
 None=�6N    � WindowStartupLocation$ CenterScreen=�6a    � 	Resources 5	      '   !Sent2me_win_client.sent2meDataSet   sent2meDataSet  employeeViewSource �� Source �� Source��%Y   &	        &	      7     5
   
   6   �� 5   
    6:   �� *
Employee+8   5      .��5      �  � DataContext# [ 6   .+�5   
   �� -   5        $��
Insert_btn��5      $!��เพิ่มสาขา��6#   $
��Left=�67   $��
50,234,0,0q�6R   $	��Top=�6f   $��75��6~   6�   �� 5   
   -   5        $��branch_name_txt��5      $
��Left=�6)   $��23��6D   $��	83,36,0,0q�6P    �� TextWrapping$
 Wrap=�6c   $�� ��6w   $	��Top=�6   $	��186��6�   �� 5   
   -   5        $��branch_add_txt��5      $
��Left=�6(   $��52��6C   $��	83,64,0,0q�6O   $
 Wrap=�6b   $�� ��6v   $	��Top=�6~   $	��186��6�   �� 5   
   -   5        $��branch_latlong_txt��5      $
��Left=�6,   $��23��6G   $��
83,179,0,0q�6S   $
 Wrap=�6g   $�� ��6{   $	��Top=�6�   $	��161��6�   �� 5   
   $��ชื่อสาขา��6   $
��Left=�6#   $��	10,33,0,0q�6>   $	��Top=�6Q   �� 5   
   $'��!ที่อยู่สาขา��6   $
��Left=�6&   $��	10,64,0,0q�6A   $	��Top=�6T   �� 5   
   $��พิกัด��6   $
��Left=�6    $��
26,175,0,0q�6;   $	��Top=�6O   �� 5   
   $E��?เลือกผู้จัดการสาขานี้��6   $
��Left=�60   $��
10,130,0,0q�6K   $	��Top=�6_   �� 5   
   -   5        $��Exit_btn��5      $��ยกเลิก��6!   $
��Left=�62   $��169,234,0,0q�6M   $	��Top=�6b   $��75��6z   6�   � 5   
   -   5         �Name$ grid1��5      $
��Left=�6   $��117,130,0,0q�69   $	��Top=�6N   $��39��6f   $	��159��6r   	 � ColumnDefinitions	 5      �� 5      $
��Auto �6#   �� 5      $
��Auto �6#   
 � RowDefinitions
 5      �� 5      $
��Auto �6    .+�5      �� -   5         ��Name$ emp_nameComboBox��5       �� DisplayMemberPath$ emp_name��61   $
��Left=�6N   $
��Auto��6i   $��-1,6,-47.2,-0.2q�6�   $��0��6�   $��Center=�6�   $	��157��6�   $��2��6�    �� SelectedIndex$ 0��6�   ��6w   ��  �� SelectedValuePath 6  �� *emp_id+��5       �� 5!      .R�5"      $� 5#      5%      5&      5(      5)      