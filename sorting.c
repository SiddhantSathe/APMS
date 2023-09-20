#include <stdio.h>

int main()
{   
    printf("Program by pranav \n");
    int n,i,j,count=0,temp,op;
    
    printf("Enter the value of n \n");
    scanf("%d",&n);
    int arr[n];
    printf("Enter the value for sorting \n");
    for(i=0;i<n;i++){
        scanf("%d",&arr[i]);
    }
    printf("\n The unsorted array \n");
for(i=0;i<n;i++){
    printf("%d \t",arr[i]);
}

do{
    printf("\n The options are \n ");
        printf("1.Bubble \n");
        printf("2.selection \n ");
        printf("3.Delete \n ");
        printf("4.Exit \n ");
        
        printf("Enter the operation of to perform \n");
        scanf("%d",&op);

    switch (op)
    {
    case 1:
        printf("\n sorting by bubble sort \n");
for(i=0;i<n;i++){
    for(j=0;j<n-1;j++){
        if(arr[j]>arr[j+1]){
            temp=arr[j+1];
            arr[j+1]=arr[j];
            arr[j]=temp;
            
            count++;
        }
    }
}

printf("The sorted array \n");
for(i=0;i<n;i++){
    printf("%d \t",arr[i]);
}
printf(" \ncounts :%d \n",count);
printf("iterations :%d \n",n-1);

        break;
    
    case 2:
 printf("\n sorting by selection sort \n");
for(i=0;i<n;i++){
    for(j=i+1;j<n;j++){
        if(arr[i]>arr[j]){
            temp=arr[j];
            arr[j]=arr[i];
            arr[i]=temp;
            
            count++;
        }
    }
}

printf("The sorted array \n");
for(i=0;i<n;i++){
    printf("%d \t",arr[i]);
}

printf(" \ncounts :%d \n",count);

    break;
    case 3:
 printf("\n sorting by selection sort \n");
for(i=0;i<n;i++){
     temp = arr[i];
        j = i - 1;

        while (j >= 0 && arr[j] > temp) {
            arr[j + 1] = arr[j];
            j = j - 1;
        }
        arr[j + 1] = temp;
    }


printf("The sorted array \n");
for(i=0;i<n;i++){
    printf("%d \t",arr[i]);
}

    break;
    case 4:
    printf("Exit");
    break;
    }

}while(op!=4);


    return 0;
}