package greet

import (
	"fmt"
	"mycli/internal/config"
	"github.com/spf13/cobra"
)

var Cmd = &cobra.Command{
	Use:   "greet",
	Short: "问候命令",
	Long:  `向用户发送友好的问候`,
	Run: func(cmd *cobra.Command, args []string) {
		// 从统一配置获取名字（映射到 greet.name）
		name := config.C.Greet.Name
		fmt.Printf("你好，%s！\n", name)
	},
}

func init() {
	// 定义短标志和长标志，设置默认值
	Cmd.Flags().StringP("name", "n", "世界", "指定问候对象的名字")
}
