   M S B A M L   `   `   `  ����M  ISent2me_win_client, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:Sent2me_win_clientSent2me_win_client  5   	   -    'Sent2me_win_client.package_price_editor   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   2local clr-namespace:Sent2me_win_client     5   	   -   5          � Title$N  Hการเปลี่ยนอัตราค่าบริการ��5   	   $��515.09��6*   $��785.192��6:    � WindowStyle$
 None=�6a    � WindowStartupLocation$ CenterOwner=�6t    � 
ResizeMode$ NoResize=�6�    � 	Resources 5	      '   !Sent2me_win_client.sent2meDataSet   sent2meDataSet  package_typeViewSource �� Source �� Source��%]   &	        &	      7     5
   
   6   �� 5   
    6>   �� *Package_type+8   5      .��5      � .+�5   
   &   System.Windows.Controls.DataGrid  -   5        $��package_price_datagrid��5      $
��Left=�61   $	��466��6L   $��	10,10,0,0q�6Y   $	��Top=�6l   $	��283��6�   �� 5   
   -   5        $��Weight_rate_txt��5      $
��Left=�6)   $��23��6D   $��544,205,0,0q�6P    �� TextWrapping$
 Wrap=�6e   $�� ��6y   $	��Top=�6�   $	��128��6�   � 5   
   -   5         �Name$ grid1��5      	 � DataContext#	 [ 6   $
��Left=�6T   $��432,168,0,0q�6o   $	��Top=�6�   $	��294��6�   
 � ColumnDefinitions
 5      �� 5      $
��Auto �6#   $
��88.8��60   �� 5      $
��Auto �6#   $��165.6��60    � RowDefinitions 5      �� 5      $
��Auto �6    .+�5      �� $!��ชนิดพัสดุ��6   $��0��6(   $
��Left=�68   $��3,3,0,3q�6S   $��0��6d   $��Center=�6q   $��26��6�   $��53��6�   �� 5      -   5         ��Name$ package_type_nameComboBox��5      $��1��6:    �� DisplayMemberPath$ package_type_name��6J   $
��Left=�6p   $��23��6�   $��
24.4,3,0,6q�6�   $��0��6�   $��Center=�6�   $	��132��6�   ��6�   ��  �� SelectedValuePath 6�   �� *package_type_id+��5      �� 5      .R�5      $� 5      5       5!      �� 5"   
   $0��*น้ำหนักไม่เกิน��6   $
��Left=�6)   $��432,202,0,0q�6D   $	��Top=�6Y   �� 5#   
   $��กรัม��6   $
��Left=�6   $��687,202,0,0q�6:   $	��Top=�6O   �� 5$   
   -   5        $��cost_txt��5$      $
��Left=�6"   $��23��6=   $��544,233,0,0q�6I   $
 Wrap=�6^   $�� ��6r   $	��Top=�6z   $	��128��6�   �� 5%   
   $��ราคา��6   $
��Left=�6   $��432,230,0,0q�6:   $	��Top=�6O   �� 5&   
   -   5        $��add_package_price��5&      $��เพิ่ม��6*   $
��Left=�6:   $��525,287,0,0q�6U   $	��Top=�6j   $	��105��6�   $��49��6�   ���	#FF54C736 5'       �� 
TargetType �� Property �� Value��%_   '��       �� 5(      " ��6   .�5)      ��  �@��CornerRadius$ 10��65   5*      5+      5,      �� 5-   
   -   5        $��delete_package_price��5-      $��ลบ��6-   $
��Left=�6:   $��
307,10,0,0q�6U   $	��Top=�6i   $	��105��6�   $��37��6�   ���	#FFFF4545 5.      ��%_   '��       �� 5/      " ��6   .�50      ��  �@��CornerRadius$ 10��65   51      52      53      �� 54   
   $��	บาท��6   $
��Left=�6   $��687,230,0,0q�69   $	��Top=�6N   �� 55   
   -	   5        $��	close_btn��55      $��	ปิด��6"   $
��Left=�60   $��687,479,0,0q�6K   $	��Top=�6`   $��75��6x   ���	#FFE515156�   �� 56   
   -
   5        $��Show_branch��56      $��Label��6#   $
��Left=�63   $��
431,43,0,0q�6N   $	��Top=�6b   $	��331��6z   58      59      